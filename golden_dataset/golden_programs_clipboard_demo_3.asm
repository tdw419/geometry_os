; DESCRIPTION: Geometry OS program to draw a red object.

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
    LDI r6, 0
    FILL r6

    ; ── Title bar ──
    LDI r2, 2
    LDI r15, 0
    LDI r14, title
    TEXT r2, r15, r14

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r0, 72            ; 'H'
    STORE r13, r0
    LDI r13, 0x3001
    LDI r0, 101           ; 'e'
    STORE r13, r0
    LDI r13, 0x3002
    LDI r0, 108           ; 'l'
    STORE r13, r0
    LDI r13, 0x3003
    LDI r0, 108           ; 'l'
    STORE r13, r0
    LDI r13, 0x3004
    LDI r0, 111           ; 'o'
    STORE r13, r0
    LDI r13, 0x3005
    LDI r0, 0             ; null terminator
    STORE r13, r0

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r0, 0             ; mode: store
    LDI r9, 0x3000        ; source addr
    LDI r11, 5             ; length
    CLIP_TEXT r0, r9, r11

    ; Draw label for step 1
    LDI r2, 2
    LDI r15, 16
    LDI r14, step1_label
    TEXT r2, r15, r14

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r0, 1             ; mode: paste
    LDI r9, 0x3100        ; dest addr
    LDI r11, 20            ; max len
    CLIP_TEXT r0, r9, r11
    LDI r2, 2
    LDI r15, 24
    LDI r14, 0x3100
    TEXT r2, r15, r14

    ; Visual indicator bar (green = text stored)
    LDI r3, 0x00FF00
    LDI r5, 2
    LDI r13, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r0, 0             ; mode: push
    LDI r9, 0             ; slot (unused for push)
    CLIP_HISTORY r0, r9

    ; Write "World" to RAM at 0x3000
    LDI r13, 0x3000
    LDI r0, 87            ; 'W'
    STORE r13, r0
    LDI r13, 0x3001
    LDI r0, 111           ; 'o'
    STORE r13, r0
    LDI r13, 0x3002
    LDI r0, 114           ; 'r'
    STORE r13, r0
    LDI r13, 0x3003
    LDI r0, 108           ; 'l'
    STORE r13, r0
    LDI r13, 0x3004
    LDI r0, 100           ; 'd'
    STORE r13, r0
    LDI r13, 0x3005
    LDI r0, 0
    STORE r13, r0

    ; Store "World" in text clipboard
    LDI r0, 0
    LDI r9, 0x3000
    LDI r11, 5
    CLIP_TEXT r0, r9, r11

    ; Draw label for step 2
    LDI r2, 2
    LDI r15, 48
    LDI r14, step2_label
    TEXT r2, r15, r14

    ; Paste "World"
    LDI r0, 1
    LDI r9, 0x3100
    LDI r11, 20
    CLIP_TEXT r0, r9, r11
    LDI r2, 2
    LDI r15, 56
    LDI r14, 0x3100
    TEXT r2, r15, r14

    ; Visual indicator bar (yellow = history + new text)
    LDI r3, 0xFFFF00
    LDI r5, 2
    LDI r13, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r0, 2             ; mode: restore
    LDI r9, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r0, r9

    ; Draw label for step 3
    LDI r2, 2
    LDI r15, 80
    LDI r14, step3_label
    TEXT r2, r15, r14

    ; Paste restored text
    LDI r0, 1
    LDI r9, 0x3100
    LDI r11, 20
    CLIP_TEXT r0, r9, r11
    LDI r2, 2
    LDI r15, 88
    LDI r14, 0x3100
    TEXT r2, r15, r14

    ; Visual indicator bar (cyan = restored)
    LDI r3, 0x00FFFF
    LDI r5, 2
    LDI r13, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r8, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r13, 0x3000
    LDI r0, 48            ; '0'
    ADD r0, r8
    STORE r13, r0
    LDI r13, 0x3001
    LDI r0, 0
    STORE r13, r0

    ; Store in text clipboard
    LDI r0, 0
    LDI r9, 0x3000
    LDI r11, 1
    CLIP_TEXT r0, r9, r11

    ; Push to history
    LDI r0, 0
    LDI r9, 0
    CLIP_HISTORY r0, r9

    ADDI r8, 1
    LDI r12, 10
    CMP r8, r12
    BLT r6, fill_loop

    ; Draw label for step 4
    LDI r2, 2
    LDI r15, 112
    LDI r14, step4_label
    TEXT r2, r15, r14

    ; Restore oldest surviving entry (should be "2")
    LDI r0, 2             ; restore
    LDI r9, 7             ; oldest slot
    CLIP_HISTORY r0, r9

    LDI r0, 1
    LDI r9, 0x3100
    LDI r11, 20
    CLIP_TEXT r0, r9, r11
    LDI r2, 2
    LDI r15, 120
    LDI r14, 0x3100
    TEXT r2, r15, r14

    ; Visual indicator bar (magenta = ring buffer)
    LDI r3, 0xFF00FF
    LDI r5, 2
    LDI r13, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r0, 3             ; mode: clear
    LDI r9, 0
    CLIP_HISTORY r0, r9

    ; Draw label for step 5
    LDI r2, 2
    LDI r15, 144
    LDI r14, step5_label
    TEXT r2, r15, r14

    ; Visual indicator bar (white = cleared)
    LDI r3, 0xFFFFFF
    LDI r5, 2
    LDI r13, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r3 = color, r5 = x, r13 = y
draw_bar:
    LDI r7, 40           ; width
bar_loop:
    PSET r5, r13, r3
    ADDI r5, 1
    SUBI r7, 1
    JNZ r7, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
