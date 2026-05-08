; DESCRIPTION: This GeOS assembly code demonstrates a multi-format clipboard and history system, showcasing functionalities such as storing and pasting text, pushing snapshots to history, handling ring buffer overflow with an 8-slot capacity, and clearing the history. It visually verifies these operations through colored bars representing different states.

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
    LDI r7, 0
    FILL r7

    ; ── Title bar ──
    LDI r15, 2
    LDI r11, 0
    LDI r8, title
    TEXT r15, r11, r8

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r1, 0x3000
    LDI r13, 72            ; 'H'
    STORE r1, r13
    LDI r1, 0x3001
    LDI r13, 101           ; 'e'
    STORE r1, r13
    LDI r1, 0x3002
    LDI r13, 108           ; 'l'
    STORE r1, r13
    LDI r1, 0x3003
    LDI r13, 108           ; 'l'
    STORE r1, r13
    LDI r1, 0x3004
    LDI r13, 111           ; 'o'
    STORE r1, r13
    LDI r1, 0x3005
    LDI r13, 0             ; null terminator
    STORE r1, r13

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r13, 0             ; mode: store
    LDI r3, 0x3000        ; source addr
    LDI r12, 5             ; length
    CLIP_TEXT r13, r3, r12

    ; Draw label for step 1
    LDI r15, 2
    LDI r11, 16
    LDI r8, step1_label
    TEXT r15, r11, r8

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r13, 1             ; mode: paste
    LDI r3, 0x3100        ; dest addr
    LDI r12, 20            ; max len
    CLIP_TEXT r13, r3, r12
    LDI r15, 2
    LDI r11, 24
    LDI r8, 0x3100
    TEXT r15, r11, r8

    ; Visual indicator bar (green = text stored)
    LDI r14, 0x00FF00
    LDI r0, 2
    LDI r1, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r13, 0             ; mode: push
    LDI r3, 0             ; slot (unused for push)
    CLIP_HISTORY r13, r3

    ; Write "World" to RAM at 0x3000
    LDI r1, 0x3000
    LDI r13, 87            ; 'W'
    STORE r1, r13
    LDI r1, 0x3001
    LDI r13, 111           ; 'o'
    STORE r1, r13
    LDI r1, 0x3002
    LDI r13, 114           ; 'r'
    STORE r1, r13
    LDI r1, 0x3003
    LDI r13, 108           ; 'l'
    STORE r1, r13
    LDI r1, 0x3004
    LDI r13, 100           ; 'd'
    STORE r1, r13
    LDI r1, 0x3005
    LDI r13, 0
    STORE r1, r13

    ; Store "World" in text clipboard
    LDI r13, 0
    LDI r3, 0x3000
    LDI r12, 5
    CLIP_TEXT r13, r3, r12

    ; Draw label for step 2
    LDI r15, 2
    LDI r11, 48
    LDI r8, step2_label
    TEXT r15, r11, r8

    ; Paste "World"
    LDI r13, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r13, r3, r12
    LDI r15, 2
    LDI r11, 56
    LDI r8, 0x3100
    TEXT r15, r11, r8

    ; Visual indicator bar (yellow = history + new text)
    LDI r14, 0xFFFF00
    LDI r0, 2
    LDI r1, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r13, 2             ; mode: restore
    LDI r3, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r13, r3

    ; Draw label for step 3
    LDI r15, 2
    LDI r11, 80
    LDI r8, step3_label
    TEXT r15, r11, r8

    ; Paste restored text
    LDI r13, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r13, r3, r12
    LDI r15, 2
    LDI r11, 88
    LDI r8, 0x3100
    TEXT r15, r11, r8

    ; Visual indicator bar (cyan = restored)
    LDI r14, 0x00FFFF
    LDI r0, 2
    LDI r1, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r9, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r1, 0x3000
    LDI r13, 48            ; '0'
    ADD r13, r9
    STORE r1, r13
    LDI r1, 0x3001
    LDI r13, 0
    STORE r1, r13

    ; Store in text clipboard
    LDI r13, 0
    LDI r3, 0x3000
    LDI r12, 1
    CLIP_TEXT r13, r3, r12

    ; Push to history
    LDI r13, 0
    LDI r3, 0
    CLIP_HISTORY r13, r3

    ADDI r9, 1
    LDI r10, 10
    CMP r9, r10
    BLT r7, fill_loop

    ; Draw label for step 4
    LDI r15, 2
    LDI r11, 112
    LDI r8, step4_label
    TEXT r15, r11, r8

    ; Restore oldest surviving entry (should be "2")
    LDI r13, 2             ; restore
    LDI r3, 7             ; oldest slot
    CLIP_HISTORY r13, r3

    LDI r13, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r13, r3, r12
    LDI r15, 2
    LDI r11, 120
    LDI r8, 0x3100
    TEXT r15, r11, r8

    ; Visual indicator bar (magenta = ring buffer)
    LDI r14, 0xFF00FF
    LDI r0, 2
    LDI r1, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r13, 3             ; mode: clear
    LDI r3, 0
    CLIP_HISTORY r13, r3

    ; Draw label for step 5
    LDI r15, 2
    LDI r11, 144
    LDI r8, step5_label
    TEXT r15, r11, r8

    ; Visual indicator bar (white = cleared)
    LDI r14, 0xFFFFFF
    LDI r0, 2
    LDI r1, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r14 = color, r0 = x, r1 = y
draw_bar:
    LDI r6, 40           ; width
bar_loop:
    PSET r0, r1, r14
    ADDI r0, 1
    SUBI r6, 1
    JNZ r6, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
