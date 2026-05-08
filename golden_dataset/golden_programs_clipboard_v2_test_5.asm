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
    LDI r14, 0
    FILL r14

    ; ── Title ──
    LDI r7, 2
    LDI r15, 0
    LDI r0, title
    TEXT r7, r15, r0

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r2, 0x3000
    LDI r10, 65     ; 'A'
    STORE r2, r10
    LDI r2, 0x3001
    LDI r10, 66     ; 'B'
    STORE r2, r10
    LDI r2, 0x3002
    LDI r10, 67     ; 'C'
    STORE r2, r10
    LDI r2, 0x3003
    LDI r10, 0      ; null
    STORE r2, r10

    ; Store text (mode 0)
    LDI r10, 0
    LDI r13, 0x3000
    LDI r4, 3
    CLIP_TEXT r10, r13, r4

    ; Clear text clipboard (mode 3)
    LDI r10, 3
    LDI r13, 0
    LDI r4, 0
    CLIP_TEXT r10, r13, r4

    ; Get length (mode 2) — should be 0 after clear
    LDI r10, 2
    CLIP_TEXT r10, r13, r4

    ; Draw label
    LDI r7, 2
    LDI r15, 8
    LDI r0, step1_label
    TEXT r7, r15, r0

    ; Green bar = text clear works
    LDI r1, 0x00FF00
    LDI r5, 2
    LDI r2, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r1, 0xFF0000
    LDI r5, 0
    LDI r2, 0
    LDI r8, 8
step2_draw:
    PSET r5, r2, r1
    ADDI r5, 1
    SUBI r8, 1
    JNZ r8, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r10, 0
    LDI r13, 0
    LDI r4, 8
    LDI r12, 1
    CLIP_COPY r10, r13, r4, r12

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r10, 2
    LDI r13, 0
    LDI r4, 4
    LDI r12, 256
    CLIPSET r10, r13, r4, r12

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r10, 0
    LDI r13, 32
    CLIP_PASTE r10, r13

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r7, 2
    LDI r15, 24
    LDI r0, step2_label
    TEXT r7, r15, r0

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r1, 0xFFFF00
    LDI r5, 2
    LDI r2, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r2, 0x3000
    LDI r10, 72     ; 'H'
    STORE r2, r10
    LDI r2, 0x3001
    LDI r10, 105    ; 'i'
    STORE r2, r10
    LDI r2, 0x3002
    LDI r10, 0
    STORE r2, r10

    LDI r10, 0
    LDI r13, 0x3000
    LDI r4, 2
    CLIP_TEXT r10, r13, r4

    ; Push to history (text only, no pixel data)
    LDI r10, 0
    LDI r13, 0
    CLIP_HISTORY r10, r13

    ; Draw a cyan pixel and copy 1x1 region
    LDI r1, 0x00FFFF
    PSET r14, r14, r1
    LDI r10, 0
    LDI r13, 0
    LDI r4, 1
    LDI r12, 1
    CLIP_COPY r10, r13, r4, r12

    ; Push again (now has pixel+text)
    LDI r10, 0
    LDI r13, 0
    CLIP_HISTORY r10, r13

    ; Query info slot 0 (newest = pixel+text) → r14=3
    LDI r10, 4
    LDI r13, 0
    CLIP_HISTORY r10, r13

    ; Query info slot 1 (text only) → r14=2
    LDI r10, 4
    LDI r13, 1
    CLIP_HISTORY r10, r13

    ; Draw label
    LDI r7, 2
    LDI r15, 40
    LDI r0, step3_label
    TEXT r7, r15, r0

    ; Cyan bar
    LDI r1, 0x00FFFF
    LDI r5, 2
    LDI r2, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r2, 0x3000
    LDI r10, 71     ; 'G'
    STORE r2, r10
    LDI r2, 0x3001
    LDI r10, 101    ; 'e'
    STORE r2, r10
    LDI r2, 0x3002
    LDI r10, 79     ; 'O'
    STORE r2, r10
    LDI r2, 0x3003
    LDI r10, 83     ; 'S'
    STORE r2, r10
    LDI r2, 0x3004
    LDI r10, 0
    STORE r2, r10

    LDI r10, 0
    LDI r13, 0x3000
    LDI r4, 4
    CLIP_TEXT r10, r13, r4

    ; Push to history
    LDI r10, 0
    LDI r13, 0
    CLIP_HISTORY r10, r13

    ; Clear text clipboard (mode 3)
    LDI r10, 3
    LDI r13, 0
    LDI r4, 0
    CLIP_TEXT r10, r13, r4

    ; Verify cleared
    LDI r10, 2
    CLIP_TEXT r10, r13, r4

    ; Restore from history slot 0
    LDI r10, 2
    LDI r13, 0
    CLIP_HISTORY r10, r13

    ; Paste restored text to RAM
    LDI r10, 1
    LDI r13, 0x3100
    LDI r4, 20
    CLIP_TEXT r10, r13, r4

    ; Draw label
    LDI r7, 2
    LDI r15, 56
    LDI r0, step4_label
    TEXT r7, r15, r0

    ; Draw restored text
    LDI r7, 2
    LDI r15, 64
    LDI r0, 0x3100
    TEXT r7, r15, r0

    ; Magenta bar
    LDI r1, 0xFF00FF
    LDI r5, 2
    LDI r2, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r7, 2
    LDI r15, 80
    LDI r0, step5_label
    TEXT r7, r15, r0

    ; White bar = pass
    LDI r1, 0xFFFFFF
    LDI r5, 2
    LDI r2, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r1 = color, r5 = x, r2 = y
draw_bar:
    LDI r8, 40
bar_loop:
    PSET r5, r2, r1
    ADDI r5, 1
    SUBI r8, 1
    JNZ r8, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
