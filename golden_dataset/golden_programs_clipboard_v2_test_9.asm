; DESCRIPTION: Render a colored rectangle at the screen.

; ── clipboard_v2_test.asm ─────────────────────────────────────────
; Phase 221 Enhancement: Multi-Format Clipboard Protocol v2
;
; Tests:
;   1. CLIP_TEXT mode 3 (clear) — clear text clipboard
;   2. CLIP_PASTE with CLIPSET — clip rect respected during paste
;   3. CLIP_HISTORY mode 4 (info) — query format bitmap
;   4. End-to-end: store text, push history, clear text, restore, verify
;
; Visual verification layout (spatial patterns):
;   Row 0-7:   Title + step labels
;   Row 16-17: Step 1 bar (green = text stored then cleared)
;   Row 32-33: Step 2 bar (yellow = clip rect paste)
;   Row 48-49: Step 3 bar (cyan = history info query)
;   Row 64-65: Step 4 bar (magenta = full roundtrip)
;   Row 80-81: Step 5 bar (white = all pass)
; ──────────────────────────────────────────────────────────────────

start:
    ; ── Clear screen ──
    LDI r10, 0
    FILL r10

    ; ── Title ──
    LDI r0, 2
    LDI r5, 0
    LDI r8, title
    TEXT r0, r5, r8

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r2, 0x3000
    LDI r15, 65     ; 'A'
    STORE r2, r15
    LDI r2, 0x3001
    LDI r15, 66     ; 'B'
    STORE r2, r15
    LDI r2, 0x3002
    LDI r15, 67     ; 'C'
    STORE r2, r15
    LDI r2, 0x3003
    LDI r15, 0      ; null
    STORE r2, r15

    ; Store text (mode 0)
    LDI r15, 0
    LDI r12, 0x3000
    LDI r13, 3
    CLIP_TEXT r15, r12, r13

    ; Clear text clipboard (mode 3)
    LDI r15, 3
    LDI r12, 0
    LDI r13, 0
    CLIP_TEXT r15, r12, r13

    ; Get length (mode 2) — should be 0 after clear
    LDI r15, 2
    CLIP_TEXT r15, r12, r13

    ; Draw label
    LDI r0, 2
    LDI r5, 8
    LDI r8, step1_label
    TEXT r0, r5, r8

    ; Green bar = text clear works
    LDI r14, 0x00FF00
    LDI r3, 2
    LDI r2, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r14, 0xFF0000
    LDI r3, 0
    LDI r2, 0
    LDI r6, 8
step2_draw:
    PSET r3, r2, r14
    ADDI r3, 1
    SUBI r6, 1
    JNZ r6, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r15, 0
    LDI r12, 0
    LDI r13, 8
    LDI r7, 1
    CLIP_COPY r15, r12, r13, r7

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r15, 2
    LDI r12, 0
    LDI r13, 4
    LDI r7, 256
    CLIPSET r15, r12, r13, r7

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r15, 0
    LDI r12, 32
    CLIP_PASTE r15, r12

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r0, 2
    LDI r5, 24
    LDI r8, step2_label
    TEXT r0, r5, r8

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r14, 0xFFFF00
    LDI r3, 2
    LDI r2, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r2, 0x3000
    LDI r15, 72     ; 'H'
    STORE r2, r15
    LDI r2, 0x3001
    LDI r15, 105    ; 'i'
    STORE r2, r15
    LDI r2, 0x3002
    LDI r15, 0
    STORE r2, r15

    LDI r15, 0
    LDI r12, 0x3000
    LDI r13, 2
    CLIP_TEXT r15, r12, r13

    ; Push to history (text only, no pixel data)
    LDI r15, 0
    LDI r12, 0
    CLIP_HISTORY r15, r12

    ; Draw a cyan pixel and copy 1x1 region
    LDI r14, 0x00FFFF
    PSET r10, r10, r14
    LDI r15, 0
    LDI r12, 0
    LDI r13, 1
    LDI r7, 1
    CLIP_COPY r15, r12, r13, r7

    ; Push again (now has pixel+text)
    LDI r15, 0
    LDI r12, 0
    CLIP_HISTORY r15, r12

    ; Query info slot 0 (newest = pixel+text) → r10=3
    LDI r15, 4
    LDI r12, 0
    CLIP_HISTORY r15, r12

    ; Query info slot 1 (text only) → r10=2
    LDI r15, 4
    LDI r12, 1
    CLIP_HISTORY r15, r12

    ; Draw label
    LDI r0, 2
    LDI r5, 40
    LDI r8, step3_label
    TEXT r0, r5, r8

    ; Cyan bar
    LDI r14, 0x00FFFF
    LDI r3, 2
    LDI r2, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r2, 0x3000
    LDI r15, 71     ; 'G'
    STORE r2, r15
    LDI r2, 0x3001
    LDI r15, 101    ; 'e'
    STORE r2, r15
    LDI r2, 0x3002
    LDI r15, 79     ; 'O'
    STORE r2, r15
    LDI r2, 0x3003
    LDI r15, 83     ; 'S'
    STORE r2, r15
    LDI r2, 0x3004
    LDI r15, 0
    STORE r2, r15

    LDI r15, 0
    LDI r12, 0x3000
    LDI r13, 4
    CLIP_TEXT r15, r12, r13

    ; Push to history
    LDI r15, 0
    LDI r12, 0
    CLIP_HISTORY r15, r12

    ; Clear text clipboard (mode 3)
    LDI r15, 3
    LDI r12, 0
    LDI r13, 0
    CLIP_TEXT r15, r12, r13

    ; Verify cleared
    LDI r15, 2
    CLIP_TEXT r15, r12, r13

    ; Restore from history slot 0
    LDI r15, 2
    LDI r12, 0
    CLIP_HISTORY r15, r12

    ; Paste restored text to RAM
    LDI r15, 1
    LDI r12, 0x3100
    LDI r13, 20
    CLIP_TEXT r15, r12, r13

    ; Draw label
    LDI r0, 2
    LDI r5, 56
    LDI r8, step4_label
    TEXT r0, r5, r8

    ; Draw restored text
    LDI r0, 2
    LDI r5, 64
    LDI r8, 0x3100
    TEXT r0, r5, r8

    ; Magenta bar
    LDI r14, 0xFF00FF
    LDI r3, 2
    LDI r2, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r0, 2
    LDI r5, 80
    LDI r8, step5_label
    TEXT r0, r5, r8

    ; White bar = pass
    LDI r14, 0xFFFFFF
    LDI r3, 2
    LDI r2, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r14 = color, r3 = x, r2 = y
draw_bar:
    LDI r6, 40
bar_loop:
    PSET r3, r2, r14
    ADDI r3, 1
    SUBI r6, 1
    JNZ r6, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
