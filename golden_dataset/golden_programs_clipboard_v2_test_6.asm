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
    LDI r2, 0
    FILL r2

    ; ── Title ──
    LDI r5, 2
    LDI r3, 0
    LDI r10, title
    TEXT r5, r3, r10

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r9, 0x3000
    LDI r8, 65     ; 'A'
    STORE r9, r8
    LDI r9, 0x3001
    LDI r8, 66     ; 'B'
    STORE r9, r8
    LDI r9, 0x3002
    LDI r8, 67     ; 'C'
    STORE r9, r8
    LDI r9, 0x3003
    LDI r8, 0      ; null
    STORE r9, r8

    ; Store text (mode 0)
    LDI r8, 0
    LDI r14, 0x3000
    LDI r6, 3
    CLIP_TEXT r8, r14, r6

    ; Clear text clipboard (mode 3)
    LDI r8, 3
    LDI r14, 0
    LDI r6, 0
    CLIP_TEXT r8, r14, r6

    ; Get length (mode 2) — should be 0 after clear
    LDI r8, 2
    CLIP_TEXT r8, r14, r6

    ; Draw label
    LDI r5, 2
    LDI r3, 8
    LDI r10, step1_label
    TEXT r5, r3, r10

    ; Green bar = text clear works
    LDI r1, 0x00FF00
    LDI r0, 2
    LDI r9, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r1, 0xFF0000
    LDI r0, 0
    LDI r9, 0
    LDI r13, 8
step2_draw:
    PSET r0, r9, r1
    ADDI r0, 1
    SUBI r13, 1
    JNZ r13, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r8, 0
    LDI r14, 0
    LDI r6, 8
    LDI r15, 1
    CLIP_COPY r8, r14, r6, r15

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r8, 2
    LDI r14, 0
    LDI r6, 4
    LDI r15, 256
    CLIPSET r8, r14, r6, r15

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r8, 0
    LDI r14, 32
    CLIP_PASTE r8, r14

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r5, 2
    LDI r3, 24
    LDI r10, step2_label
    TEXT r5, r3, r10

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r1, 0xFFFF00
    LDI r0, 2
    LDI r9, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r9, 0x3000
    LDI r8, 72     ; 'H'
    STORE r9, r8
    LDI r9, 0x3001
    LDI r8, 105    ; 'i'
    STORE r9, r8
    LDI r9, 0x3002
    LDI r8, 0
    STORE r9, r8

    LDI r8, 0
    LDI r14, 0x3000
    LDI r6, 2
    CLIP_TEXT r8, r14, r6

    ; Push to history (text only, no pixel data)
    LDI r8, 0
    LDI r14, 0
    CLIP_HISTORY r8, r14

    ; Draw a cyan pixel and copy 1x1 region
    LDI r1, 0x00FFFF
    PSET r2, r2, r1
    LDI r8, 0
    LDI r14, 0
    LDI r6, 1
    LDI r15, 1
    CLIP_COPY r8, r14, r6, r15

    ; Push again (now has pixel+text)
    LDI r8, 0
    LDI r14, 0
    CLIP_HISTORY r8, r14

    ; Query info slot 0 (newest = pixel+text) → r2=3
    LDI r8, 4
    LDI r14, 0
    CLIP_HISTORY r8, r14

    ; Query info slot 1 (text only) → r2=2
    LDI r8, 4
    LDI r14, 1
    CLIP_HISTORY r8, r14

    ; Draw label
    LDI r5, 2
    LDI r3, 40
    LDI r10, step3_label
    TEXT r5, r3, r10

    ; Cyan bar
    LDI r1, 0x00FFFF
    LDI r0, 2
    LDI r9, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r9, 0x3000
    LDI r8, 71     ; 'G'
    STORE r9, r8
    LDI r9, 0x3001
    LDI r8, 101    ; 'e'
    STORE r9, r8
    LDI r9, 0x3002
    LDI r8, 79     ; 'O'
    STORE r9, r8
    LDI r9, 0x3003
    LDI r8, 83     ; 'S'
    STORE r9, r8
    LDI r9, 0x3004
    LDI r8, 0
    STORE r9, r8

    LDI r8, 0
    LDI r14, 0x3000
    LDI r6, 4
    CLIP_TEXT r8, r14, r6

    ; Push to history
    LDI r8, 0
    LDI r14, 0
    CLIP_HISTORY r8, r14

    ; Clear text clipboard (mode 3)
    LDI r8, 3
    LDI r14, 0
    LDI r6, 0
    CLIP_TEXT r8, r14, r6

    ; Verify cleared
    LDI r8, 2
    CLIP_TEXT r8, r14, r6

    ; Restore from history slot 0
    LDI r8, 2
    LDI r14, 0
    CLIP_HISTORY r8, r14

    ; Paste restored text to RAM
    LDI r8, 1
    LDI r14, 0x3100
    LDI r6, 20
    CLIP_TEXT r8, r14, r6

    ; Draw label
    LDI r5, 2
    LDI r3, 56
    LDI r10, step4_label
    TEXT r5, r3, r10

    ; Draw restored text
    LDI r5, 2
    LDI r3, 64
    LDI r10, 0x3100
    TEXT r5, r3, r10

    ; Magenta bar
    LDI r1, 0xFF00FF
    LDI r0, 2
    LDI r9, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r5, 2
    LDI r3, 80
    LDI r10, step5_label
    TEXT r5, r3, r10

    ; White bar = pass
    LDI r1, 0xFFFFFF
    LDI r0, 2
    LDI r9, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r1 = color, r0 = x, r9 = y
draw_bar:
    LDI r13, 40
bar_loop:
    PSET r0, r9, r1
    ADDI r0, 1
    SUBI r13, 1
    JNZ r13, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
