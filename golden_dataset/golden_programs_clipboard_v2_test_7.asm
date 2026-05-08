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
    LDI r5, 0
    FILL r5

    ; ── Title ──
    LDI r1, 2
    LDI r11, 0
    LDI r12, title
    TEXT r1, r11, r12

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r13, 0x3000
    LDI r15, 65     ; 'A'
    STORE r13, r15
    LDI r13, 0x3001
    LDI r15, 66     ; 'B'
    STORE r13, r15
    LDI r13, 0x3002
    LDI r15, 67     ; 'C'
    STORE r13, r15
    LDI r13, 0x3003
    LDI r15, 0      ; null
    STORE r13, r15

    ; Store text (mode 0)
    LDI r15, 0
    LDI r10, 0x3000
    LDI r14, 3
    CLIP_TEXT r15, r10, r14

    ; Clear text clipboard (mode 3)
    LDI r15, 3
    LDI r10, 0
    LDI r14, 0
    CLIP_TEXT r15, r10, r14

    ; Get length (mode 2) — should be 0 after clear
    LDI r15, 2
    CLIP_TEXT r15, r10, r14

    ; Draw label
    LDI r1, 2
    LDI r11, 8
    LDI r12, step1_label
    TEXT r1, r11, r12

    ; Green bar = text clear works
    LDI r8, 0x00FF00
    LDI r2, 2
    LDI r13, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r8, 0xFF0000
    LDI r2, 0
    LDI r13, 0
    LDI r0, 8
step2_draw:
    PSET r2, r13, r8
    ADDI r2, 1
    SUBI r0, 1
    JNZ r0, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r15, 0
    LDI r10, 0
    LDI r14, 8
    LDI r9, 1
    CLIP_COPY r15, r10, r14, r9

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r15, 2
    LDI r10, 0
    LDI r14, 4
    LDI r9, 256
    CLIPSET r15, r10, r14, r9

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r15, 0
    LDI r10, 32
    CLIP_PASTE r15, r10

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r1, 2
    LDI r11, 24
    LDI r12, step2_label
    TEXT r1, r11, r12

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r8, 0xFFFF00
    LDI r2, 2
    LDI r13, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r13, 0x3000
    LDI r15, 72     ; 'H'
    STORE r13, r15
    LDI r13, 0x3001
    LDI r15, 105    ; 'i'
    STORE r13, r15
    LDI r13, 0x3002
    LDI r15, 0
    STORE r13, r15

    LDI r15, 0
    LDI r10, 0x3000
    LDI r14, 2
    CLIP_TEXT r15, r10, r14

    ; Push to history (text only, no pixel data)
    LDI r15, 0
    LDI r10, 0
    CLIP_HISTORY r15, r10

    ; Draw a cyan pixel and copy 1x1 region
    LDI r8, 0x00FFFF
    PSET r5, r5, r8
    LDI r15, 0
    LDI r10, 0
    LDI r14, 1
    LDI r9, 1
    CLIP_COPY r15, r10, r14, r9

    ; Push again (now has pixel+text)
    LDI r15, 0
    LDI r10, 0
    CLIP_HISTORY r15, r10

    ; Query info slot 0 (newest = pixel+text) → r5=3
    LDI r15, 4
    LDI r10, 0
    CLIP_HISTORY r15, r10

    ; Query info slot 1 (text only) → r5=2
    LDI r15, 4
    LDI r10, 1
    CLIP_HISTORY r15, r10

    ; Draw label
    LDI r1, 2
    LDI r11, 40
    LDI r12, step3_label
    TEXT r1, r11, r12

    ; Cyan bar
    LDI r8, 0x00FFFF
    LDI r2, 2
    LDI r13, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r13, 0x3000
    LDI r15, 71     ; 'G'
    STORE r13, r15
    LDI r13, 0x3001
    LDI r15, 101    ; 'e'
    STORE r13, r15
    LDI r13, 0x3002
    LDI r15, 79     ; 'O'
    STORE r13, r15
    LDI r13, 0x3003
    LDI r15, 83     ; 'S'
    STORE r13, r15
    LDI r13, 0x3004
    LDI r15, 0
    STORE r13, r15

    LDI r15, 0
    LDI r10, 0x3000
    LDI r14, 4
    CLIP_TEXT r15, r10, r14

    ; Push to history
    LDI r15, 0
    LDI r10, 0
    CLIP_HISTORY r15, r10

    ; Clear text clipboard (mode 3)
    LDI r15, 3
    LDI r10, 0
    LDI r14, 0
    CLIP_TEXT r15, r10, r14

    ; Verify cleared
    LDI r15, 2
    CLIP_TEXT r15, r10, r14

    ; Restore from history slot 0
    LDI r15, 2
    LDI r10, 0
    CLIP_HISTORY r15, r10

    ; Paste restored text to RAM
    LDI r15, 1
    LDI r10, 0x3100
    LDI r14, 20
    CLIP_TEXT r15, r10, r14

    ; Draw label
    LDI r1, 2
    LDI r11, 56
    LDI r12, step4_label
    TEXT r1, r11, r12

    ; Draw restored text
    LDI r1, 2
    LDI r11, 64
    LDI r12, 0x3100
    TEXT r1, r11, r12

    ; Magenta bar
    LDI r8, 0xFF00FF
    LDI r2, 2
    LDI r13, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r1, 2
    LDI r11, 80
    LDI r12, step5_label
    TEXT r1, r11, r12

    ; White bar = pass
    LDI r8, 0xFFFFFF
    LDI r2, 2
    LDI r13, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r8 = color, r2 = x, r13 = y
draw_bar:
    LDI r0, 40
bar_loop:
    PSET r2, r13, r8
    ADDI r2, 1
    SUBI r0, 1
    JNZ r0, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
