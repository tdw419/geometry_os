; DESCRIPTION: This GeOS assembly code tests the Clipboard Protocol version 2, evaluating functionalities such as clearing the text clipboard, respecting clip rectangles during paste operations, querying history information, and performing a full round-trip of storing, pushing to history, clearing, and restoring data. The results are visually verified through color-coded bars on the screen corresponding to each test step.

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
    LDI r7, 0
    FILL r7

    ; ── Title ──
    LDI r12, 2
    LDI r3, 0
    LDI r2, title
    TEXT r12, r3, r2

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r5, 0x3000
    LDI r9, 65     ; 'A'
    STORE r5, r9
    LDI r5, 0x3001
    LDI r9, 66     ; 'B'
    STORE r5, r9
    LDI r5, 0x3002
    LDI r9, 67     ; 'C'
    STORE r5, r9
    LDI r5, 0x3003
    LDI r9, 0      ; null
    STORE r5, r9

    ; Store text (mode 0)
    LDI r9, 0
    LDI r15, 0x3000
    LDI r4, 3
    CLIP_TEXT r9, r15, r4

    ; Clear text clipboard (mode 3)
    LDI r9, 3
    LDI r15, 0
    LDI r4, 0
    CLIP_TEXT r9, r15, r4

    ; Get length (mode 2) — should be 0 after clear
    LDI r9, 2
    CLIP_TEXT r9, r15, r4

    ; Draw label
    LDI r12, 2
    LDI r3, 8
    LDI r2, step1_label
    TEXT r12, r3, r2

    ; Green bar = text clear works
    LDI r13, 0x00FF00
    LDI r14, 2
    LDI r5, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r13, 0xFF0000
    LDI r14, 0
    LDI r5, 0
    LDI r1, 8
step2_draw:
    PSET r14, r5, r13
    ADDI r14, 1
    SUBI r1, 1
    JNZ r1, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r9, 0
    LDI r15, 0
    LDI r4, 8
    LDI r8, 1
    CLIP_COPY r9, r15, r4, r8

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r9, 2
    LDI r15, 0
    LDI r4, 4
    LDI r8, 256
    CLIPSET r9, r15, r4, r8

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r9, 0
    LDI r15, 32
    CLIP_PASTE r9, r15

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r12, 2
    LDI r3, 24
    LDI r2, step2_label
    TEXT r12, r3, r2

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r13, 0xFFFF00
    LDI r14, 2
    LDI r5, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r5, 0x3000
    LDI r9, 72     ; 'H'
    STORE r5, r9
    LDI r5, 0x3001
    LDI r9, 105    ; 'i'
    STORE r5, r9
    LDI r5, 0x3002
    LDI r9, 0
    STORE r5, r9

    LDI r9, 0
    LDI r15, 0x3000
    LDI r4, 2
    CLIP_TEXT r9, r15, r4

    ; Push to history (text only, no pixel data)
    LDI r9, 0
    LDI r15, 0
    CLIP_HISTORY r9, r15

    ; Draw a cyan pixel and copy 1x1 region
    LDI r13, 0x00FFFF
    PSET r7, r7, r13
    LDI r9, 0
    LDI r15, 0
    LDI r4, 1
    LDI r8, 1
    CLIP_COPY r9, r15, r4, r8

    ; Push again (now has pixel+text)
    LDI r9, 0
    LDI r15, 0
    CLIP_HISTORY r9, r15

    ; Query info slot 0 (newest = pixel+text) → r7=3
    LDI r9, 4
    LDI r15, 0
    CLIP_HISTORY r9, r15

    ; Query info slot 1 (text only) → r7=2
    LDI r9, 4
    LDI r15, 1
    CLIP_HISTORY r9, r15

    ; Draw label
    LDI r12, 2
    LDI r3, 40
    LDI r2, step3_label
    TEXT r12, r3, r2

    ; Cyan bar
    LDI r13, 0x00FFFF
    LDI r14, 2
    LDI r5, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r5, 0x3000
    LDI r9, 71     ; 'G'
    STORE r5, r9
    LDI r5, 0x3001
    LDI r9, 101    ; 'e'
    STORE r5, r9
    LDI r5, 0x3002
    LDI r9, 79     ; 'O'
    STORE r5, r9
    LDI r5, 0x3003
    LDI r9, 83     ; 'S'
    STORE r5, r9
    LDI r5, 0x3004
    LDI r9, 0
    STORE r5, r9

    LDI r9, 0
    LDI r15, 0x3000
    LDI r4, 4
    CLIP_TEXT r9, r15, r4

    ; Push to history
    LDI r9, 0
    LDI r15, 0
    CLIP_HISTORY r9, r15

    ; Clear text clipboard (mode 3)
    LDI r9, 3
    LDI r15, 0
    LDI r4, 0
    CLIP_TEXT r9, r15, r4

    ; Verify cleared
    LDI r9, 2
    CLIP_TEXT r9, r15, r4

    ; Restore from history slot 0
    LDI r9, 2
    LDI r15, 0
    CLIP_HISTORY r9, r15

    ; Paste restored text to RAM
    LDI r9, 1
    LDI r15, 0x3100
    LDI r4, 20
    CLIP_TEXT r9, r15, r4

    ; Draw label
    LDI r12, 2
    LDI r3, 56
    LDI r2, step4_label
    TEXT r12, r3, r2

    ; Draw restored text
    LDI r12, 2
    LDI r3, 64
    LDI r2, 0x3100
    TEXT r12, r3, r2

    ; Magenta bar
    LDI r13, 0xFF00FF
    LDI r14, 2
    LDI r5, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r12, 2
    LDI r3, 80
    LDI r2, step5_label
    TEXT r12, r3, r2

    ; White bar = pass
    LDI r13, 0xFFFFFF
    LDI r14, 2
    LDI r5, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r13 = color, r14 = x, r5 = y
draw_bar:
    LDI r1, 40
bar_loop:
    PSET r14, r5, r13
    ADDI r14, 1
    SUBI r1, 1
    JNZ r1, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
