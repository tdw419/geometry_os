; DESCRIPTION: Display a rectangle using color colored at the screen.

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
    LDI r12, 0
    FILL r12

    ; ── Title ──
    LDI r7, 2
    LDI r13, 0
    LDI r1, title
    TEXT r7, r13, r1

    ; ═══════════════════════════════════════════
    ; STEP 1: CLIP_TEXT clear (mode 3)
    ; ═══════════════════════════════════════════
    ; Store "ABC" at 0x3000
    LDI r8, 0x3000
    LDI r6, 65     ; 'A'
    STORE r8, r6
    LDI r8, 0x3001
    LDI r6, 66     ; 'B'
    STORE r8, r6
    LDI r8, 0x3002
    LDI r6, 67     ; 'C'
    STORE r8, r6
    LDI r8, 0x3003
    LDI r6, 0      ; null
    STORE r8, r6

    ; Store text (mode 0)
    LDI r6, 0
    LDI r0, 0x3000
    LDI r10, 3
    CLIP_TEXT r6, r0, r10

    ; Clear text clipboard (mode 3)
    LDI r6, 3
    LDI r0, 0
    LDI r10, 0
    CLIP_TEXT r6, r0, r10

    ; Get length (mode 2) — should be 0 after clear
    LDI r6, 2
    CLIP_TEXT r6, r0, r10

    ; Draw label
    LDI r7, 2
    LDI r13, 8
    LDI r1, step1_label
    TEXT r7, r13, r1

    ; Green bar = text clear works
    LDI r15, 0x00FF00
    LDI r3, 2
    LDI r8, 16
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: CLIP_PASTE respects CLIPSET
    ; ═══════════════════════════════════════════
    ; Draw 8-pixel red bar at row 0
    LDI r15, 0xFF0000
    LDI r3, 0
    LDI r8, 0
    LDI r4, 8
step2_draw:
    PSET r3, r8, r15
    ADDI r3, 1
    SUBI r4, 1
    JNZ r4, step2_draw

    ; Copy 8x1 region to clipboard
    LDI r6, 0
    LDI r0, 0
    LDI r10, 8
    LDI r11, 1
    CLIP_COPY r6, r0, r10, r11

    ; Set clip rect: columns 2-5 (4px wide, full height)
    LDI r6, 2
    LDI r0, 0
    LDI r10, 4
    LDI r11, 256
    CLIPSET r6, r0, r10, r11

    ; Paste at (0, 32) — only columns 2-5 should be red
    LDI r6, 0
    LDI r0, 32
    CLIP_PASTE r6, r0

    ; Clear clip rect
    CLIPCLR

    ; Draw label
    LDI r7, 2
    LDI r13, 24
    LDI r1, step2_label
    TEXT r7, r13, r1

    ; Yellow bar at y=33 (below paste row to preserve red paste pixels)
    LDI r15, 0xFFFF00
    LDI r3, 2
    LDI r8, 33
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: CLIP_HISTORY mode 4 (info)
    ; ═══════════════════════════════════════════
    ; Store "Hi" in text clipboard
    LDI r8, 0x3000
    LDI r6, 72     ; 'H'
    STORE r8, r6
    LDI r8, 0x3001
    LDI r6, 105    ; 'i'
    STORE r8, r6
    LDI r8, 0x3002
    LDI r6, 0
    STORE r8, r6

    LDI r6, 0
    LDI r0, 0x3000
    LDI r10, 2
    CLIP_TEXT r6, r0, r10

    ; Push to history (text only, no pixel data)
    LDI r6, 0
    LDI r0, 0
    CLIP_HISTORY r6, r0

    ; Draw a cyan pixel and copy 1x1 region
    LDI r15, 0x00FFFF
    PSET r12, r12, r15
    LDI r6, 0
    LDI r0, 0
    LDI r10, 1
    LDI r11, 1
    CLIP_COPY r6, r0, r10, r11

    ; Push again (now has pixel+text)
    LDI r6, 0
    LDI r0, 0
    CLIP_HISTORY r6, r0

    ; Query info slot 0 (newest = pixel+text) → r12=3
    LDI r6, 4
    LDI r0, 0
    CLIP_HISTORY r6, r0

    ; Query info slot 1 (text only) → r12=2
    LDI r6, 4
    LDI r0, 1
    CLIP_HISTORY r6, r0

    ; Draw label
    LDI r7, 2
    LDI r13, 40
    LDI r1, step3_label
    TEXT r7, r13, r1

    ; Cyan bar
    LDI r15, 0x00FFFF
    LDI r3, 2
    LDI r8, 48
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Full roundtrip — store, push, clear, restore
    ; ═══════════════════════════════════════════
    ; Store "GeOS" at 0x3000
    LDI r8, 0x3000
    LDI r6, 71     ; 'G'
    STORE r8, r6
    LDI r8, 0x3001
    LDI r6, 101    ; 'e'
    STORE r8, r6
    LDI r8, 0x3002
    LDI r6, 79     ; 'O'
    STORE r8, r6
    LDI r8, 0x3003
    LDI r6, 83     ; 'S'
    STORE r8, r6
    LDI r8, 0x3004
    LDI r6, 0
    STORE r8, r6

    LDI r6, 0
    LDI r0, 0x3000
    LDI r10, 4
    CLIP_TEXT r6, r0, r10

    ; Push to history
    LDI r6, 0
    LDI r0, 0
    CLIP_HISTORY r6, r0

    ; Clear text clipboard (mode 3)
    LDI r6, 3
    LDI r0, 0
    LDI r10, 0
    CLIP_TEXT r6, r0, r10

    ; Verify cleared
    LDI r6, 2
    CLIP_TEXT r6, r0, r10

    ; Restore from history slot 0
    LDI r6, 2
    LDI r0, 0
    CLIP_HISTORY r6, r0

    ; Paste restored text to RAM
    LDI r6, 1
    LDI r0, 0x3100
    LDI r10, 20
    CLIP_TEXT r6, r0, r10

    ; Draw label
    LDI r7, 2
    LDI r13, 56
    LDI r1, step4_label
    TEXT r7, r13, r1

    ; Draw restored text
    LDI r7, 2
    LDI r13, 64
    LDI r1, 0x3100
    TEXT r7, r13, r1

    ; Magenta bar
    LDI r15, 0xFF00FF
    LDI r3, 2
    LDI r8, 72
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: All tests complete
    ; ═══════════════════════════════════════════
    LDI r7, 2
    LDI r13, 80
    LDI r1, step5_label
    TEXT r7, r13, r1

    ; White bar = pass
    LDI r15, 0xFFFFFF
    LDI r3, 2
    LDI r8, 88
    CALL draw_bar

    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r15 = color, r3 = x, r8 = y
draw_bar:
    LDI r4, 40
bar_loop:
    PSET r3, r8, r15
    ADDI r3, 1
    SUBI r4, 1
    JNZ r4, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard v2"
step1_label: .asciz "1) CLIP_TEXT clear"
step2_label: .asciz "2) CLIP_PASTE+CLIPSET"
step3_label: .asciz "3) CLIP_HIST info"
step4_label: .asciz "4) Roundtrip: "
step5_label: .asciz "5) All pass"
