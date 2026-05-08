; DESCRIPTION: A red object centered at the screen with fixed size.

; ── clipboard_demo.asm ─────────────────────────────────────────────
; Phase 221: Multi-Format Clipboard & History Demo
;
; Demonstrates:
;   1. Text clipboard: store/paste strings via CLIP_TEXT (0xDD)
;   2. History: push snapshots, restore from history via CLIP_HISTORY (0xDF)
;   3. Ring buffer overflow behavior (8-slot cap)
;
; Visual verification: colored bars show clipboard state at each step
; ──────────────────────────────────────────────────────────────────

start:
    ; ── Clear screen ──
    LDI r3, 0
    FILL r3

    ; ── Title bar ──
    LDI r7, 2
    LDI r9, 0
    LDI r6, title
    TEXT r7, r9, r6

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r1, 72            ; 'H'
    STORE r13, r1
    LDI r13, 0x3001
    LDI r1, 101           ; 'e'
    STORE r13, r1
    LDI r13, 0x3002
    LDI r1, 108           ; 'l'
    STORE r13, r1
    LDI r13, 0x3003
    LDI r1, 108           ; 'l'
    STORE r13, r1
    LDI r13, 0x3004
    LDI r1, 111           ; 'o'
    STORE r13, r1
    LDI r13, 0x3005
    LDI r1, 0             ; null terminator
    STORE r13, r1

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r1, 0             ; mode: store
    LDI r11, 0x3000        ; source addr
    LDI r4, 5             ; length
    CLIP_TEXT r1, r11, r4

    ; Draw label for step 1
    LDI r7, 2
    LDI r9, 16
    LDI r6, step1_label
    TEXT r7, r9, r6

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r1, 1             ; mode: paste
    LDI r11, 0x3100        ; dest addr
    LDI r4, 20            ; max len
    CLIP_TEXT r1, r11, r4
    LDI r7, 2
    LDI r9, 24
    LDI r6, 0x3100
    TEXT r7, r9, r6

    ; Visual indicator bar (green = text stored)
    LDI r5, 0x00FF00
    LDI r0, 2
    LDI r13, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r1, 0             ; mode: push
    LDI r11, 0             ; slot (unused for push)
    CLIP_HISTORY r1, r11

    ; Write "World" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r1, 87            ; 'W'
    STORE r13, r1
    LDI r13, 0x3001
    LDI r1, 111           ; 'o'
    STORE r13, r1
    LDI r13, 0x3002
    LDI r1, 114           ; 'r'
    STORE r13, r1
    LDI r13, 0x3003
    LDI r1, 108           ; 'l'
    STORE r13, r1
    LDI r13, 0x3004
    LDI r1, 100           ; 'd'
    STORE r13, r1
    LDI r13, 0x3005
    LDI r1, 0
    STORE r13, r1

    ; Store "World" in text clipboard
    LDI r1, 0
    LDI r11, 0x3000
    LDI r4, 5
    CLIP_TEXT r1, r11, r4

    ; Draw label for step 2
    LDI r7, 2
    LDI r9, 48
    LDI r6, step2_label
    TEXT r7, r9, r6

    ; Paste "World"
    LDI r1, 1
    LDI r11, 0x3100
    LDI r4, 20
    CLIP_TEXT r1, r11, r4
    LDI r7, 2
    LDI r9, 56
    LDI r6, 0x3100
    TEXT r7, r9, r6

    ; Visual indicator bar (yellow = history + new text)
    LDI r5, 0xFFFF00
    LDI r0, 2
    LDI r13, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r1, 2             ; mode: restore
    LDI r11, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r1, r11

    ; Draw label for step 3
    LDI r7, 2
    LDI r9, 80
    LDI r6, step3_label
    TEXT r7, r9, r6

    ; Paste restored text
    LDI r1, 1
    LDI r11, 0x3100
    LDI r4, 20
    CLIP_TEXT r1, r11, r4
    LDI r7, 2
    LDI r9, 88
    LDI r6, 0x3100
    TEXT r7, r9, r6

    ; Visual indicator bar (cyan = restored)
    LDI r5, 0x00FFFF
    LDI r0, 2
    LDI r13, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r2, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r13, 0x3000
    LDI r1, 48            ; '0'
    ADD r1, r2
    STORE r13, r1
    LDI r13, 0x3001
    LDI r1, 0
    STORE r13, r1

    ; Store in text clipboard
    LDI r1, 0
    LDI r11, 0x3000
    LDI r4, 1
    CLIP_TEXT r1, r11, r4

    ; Push to history
    LDI r1, 0
    LDI r11, 0
    CLIP_HISTORY r1, r11

    ADDI r2, 1
    LDI r14, 10
    CMP r2, r14
    BLT r3, fill_loop

    ; Draw label for step 4
    LDI r7, 2
    LDI r9, 112
    LDI r6, step4_label
    TEXT r7, r9, r6

    ; Restore oldest surviving entry (should be "2")
    LDI r1, 2             ; restore
    LDI r11, 7             ; oldest slot
    CLIP_HISTORY r1, r11

    LDI r1, 1
    LDI r11, 0x3100
    LDI r4, 20
    CLIP_TEXT r1, r11, r4
    LDI r7, 2
    LDI r9, 120
    LDI r6, 0x3100
    TEXT r7, r9, r6

    ; Visual indicator bar (magenta = ring buffer)
    LDI r5, 0xFF00FF
    LDI r0, 2
    LDI r13, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r1, 3             ; mode: clear
    LDI r11, 0
    CLIP_HISTORY r1, r11

    ; Draw label for step 5
    LDI r7, 2
    LDI r9, 144
    LDI r6, step5_label
    TEXT r7, r9, r6

    ; Visual indicator bar (white = cleared)
    LDI r5, 0xFFFFFF
    LDI r0, 2
    LDI r13, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r5 = color, r0 = x, r13 = y
draw_bar:
    LDI r8, 40           ; width
bar_loop:
    PSET r0, r13, r5
    ADDI r0, 1
    SUBI r8, 1
    JNZ r8, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
