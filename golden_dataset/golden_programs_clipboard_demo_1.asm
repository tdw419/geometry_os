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
    LDI r9, 0
    FILL r9

    ; ── Title bar ──
    LDI r0, 2
    LDI r8, 0
    LDI r1, title
    TEXT r0, r8, r1

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r3, 0x3000
    LDI r4, 72            ; 'H'
    STORE r3, r4
    LDI r3, 0x3001
    LDI r4, 101           ; 'e'
    STORE r3, r4
    LDI r3, 0x3002
    LDI r4, 108           ; 'l'
    STORE r3, r4
    LDI r3, 0x3003
    LDI r4, 108           ; 'l'
    STORE r3, r4
    LDI r3, 0x3004
    LDI r4, 111           ; 'o'
    STORE r3, r4
    LDI r3, 0x3005
    LDI r4, 0             ; null terminator
    STORE r3, r4

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r4, 0             ; mode: store
    LDI r11, 0x3000        ; source addr
    LDI r15, 5             ; length
    CLIP_TEXT r4, r11, r15

    ; Draw label for step 1
    LDI r0, 2
    LDI r8, 16
    LDI r1, step1_label
    TEXT r0, r8, r1

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r4, 1             ; mode: paste
    LDI r11, 0x3100        ; dest addr
    LDI r15, 20            ; max len
    CLIP_TEXT r4, r11, r15
    LDI r0, 2
    LDI r8, 24
    LDI r1, 0x3100
    TEXT r0, r8, r1

    ; Visual indicator bar (green = text stored)
    LDI r14, 0x00FF00
    LDI r7, 2
    LDI r3, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r4, 0             ; mode: push
    LDI r11, 0             ; slot (unused for push)
    CLIP_HISTORY r4, r11

    ; Write "World" to RAM at 0x3000
    LDI r3, 0x3000
    LDI r4, 87            ; 'W'
    STORE r3, r4
    LDI r3, 0x3001
    LDI r4, 111           ; 'o'
    STORE r3, r4
    LDI r3, 0x3002
    LDI r4, 114           ; 'r'
    STORE r3, r4
    LDI r3, 0x3003
    LDI r4, 108           ; 'l'
    STORE r3, r4
    LDI r3, 0x3004
    LDI r4, 100           ; 'd'
    STORE r3, r4
    LDI r3, 0x3005
    LDI r4, 0
    STORE r3, r4

    ; Store "World" in text clipboard
    LDI r4, 0
    LDI r11, 0x3000
    LDI r15, 5
    CLIP_TEXT r4, r11, r15

    ; Draw label for step 2
    LDI r0, 2
    LDI r8, 48
    LDI r1, step2_label
    TEXT r0, r8, r1

    ; Paste "World"
    LDI r4, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r4, r11, r15
    LDI r0, 2
    LDI r8, 56
    LDI r1, 0x3100
    TEXT r0, r8, r1

    ; Visual indicator bar (yellow = history + new text)
    LDI r14, 0xFFFF00
    LDI r7, 2
    LDI r3, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r4, 2             ; mode: restore
    LDI r11, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r4, r11

    ; Draw label for step 3
    LDI r0, 2
    LDI r8, 80
    LDI r1, step3_label
    TEXT r0, r8, r1

    ; Paste restored text
    LDI r4, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r4, r11, r15
    LDI r0, 2
    LDI r8, 88
    LDI r1, 0x3100
    TEXT r0, r8, r1

    ; Visual indicator bar (cyan = restored)
    LDI r14, 0x00FFFF
    LDI r7, 2
    LDI r3, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r10, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r3, 0x3000
    LDI r4, 48            ; '0'
    ADD r4, r10
    STORE r3, r4
    LDI r3, 0x3001
    LDI r4, 0
    STORE r3, r4

    ; Store in text clipboard
    LDI r4, 0
    LDI r11, 0x3000
    LDI r15, 1
    CLIP_TEXT r4, r11, r15

    ; Push to history
    LDI r4, 0
    LDI r11, 0
    CLIP_HISTORY r4, r11

    ADDI r10, 1
    LDI r6, 10
    CMP r10, r6
    BLT r9, fill_loop

    ; Draw label for step 4
    LDI r0, 2
    LDI r8, 112
    LDI r1, step4_label
    TEXT r0, r8, r1

    ; Restore oldest surviving entry (should be "2")
    LDI r4, 2             ; restore
    LDI r11, 7             ; oldest slot
    CLIP_HISTORY r4, r11

    LDI r4, 1
    LDI r11, 0x3100
    LDI r15, 20
    CLIP_TEXT r4, r11, r15
    LDI r0, 2
    LDI r8, 120
    LDI r1, 0x3100
    TEXT r0, r8, r1

    ; Visual indicator bar (magenta = ring buffer)
    LDI r14, 0xFF00FF
    LDI r7, 2
    LDI r3, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r4, 3             ; mode: clear
    LDI r11, 0
    CLIP_HISTORY r4, r11

    ; Draw label for step 5
    LDI r0, 2
    LDI r8, 144
    LDI r1, step5_label
    TEXT r0, r8, r1

    ; Visual indicator bar (white = cleared)
    LDI r14, 0xFFFFFF
    LDI r7, 2
    LDI r3, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r14 = color, r7 = x, r3 = y
draw_bar:
    LDI r12, 40           ; width
bar_loop:
    PSET r7, r3, r14
    ADDI r7, 1
    SUBI r12, 1
    JNZ r12, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
