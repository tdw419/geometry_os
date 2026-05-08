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
    LDI r4, 0
    FILL r4

    ; ── Title bar ──
    LDI r6, 2
    LDI r2, 0
    LDI r1, title
    TEXT r6, r2, r1

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r14, 72            ; 'H'
    STORE r0, r14
    LDI r0, 0x3001
    LDI r14, 101           ; 'e'
    STORE r0, r14
    LDI r0, 0x3002
    LDI r14, 108           ; 'l'
    STORE r0, r14
    LDI r0, 0x3003
    LDI r14, 108           ; 'l'
    STORE r0, r14
    LDI r0, 0x3004
    LDI r14, 111           ; 'o'
    STORE r0, r14
    LDI r0, 0x3005
    LDI r14, 0             ; null terminator
    STORE r0, r14

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r14, 0             ; mode: store
    LDI r12, 0x3000        ; source addr
    LDI r9, 5             ; length
    CLIP_TEXT r14, r12, r9

    ; Draw label for step 1
    LDI r6, 2
    LDI r2, 16
    LDI r1, step1_label
    TEXT r6, r2, r1

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r14, 1             ; mode: paste
    LDI r12, 0x3100        ; dest addr
    LDI r9, 20            ; max len
    CLIP_TEXT r14, r12, r9
    LDI r6, 2
    LDI r2, 24
    LDI r1, 0x3100
    TEXT r6, r2, r1

    ; Visual indicator bar (green = text stored)
    LDI r11, 0x00FF00
    LDI r3, 2
    LDI r0, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r14, 0             ; mode: push
    LDI r12, 0             ; slot (unused for push)
    CLIP_HISTORY r14, r12

    ; Write "World" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r14, 87            ; 'W'
    STORE r0, r14
    LDI r0, 0x3001
    LDI r14, 111           ; 'o'
    STORE r0, r14
    LDI r0, 0x3002
    LDI r14, 114           ; 'r'
    STORE r0, r14
    LDI r0, 0x3003
    LDI r14, 108           ; 'l'
    STORE r0, r14
    LDI r0, 0x3004
    LDI r14, 100           ; 'd'
    STORE r0, r14
    LDI r0, 0x3005
    LDI r14, 0
    STORE r0, r14

    ; Store "World" in text clipboard
    LDI r14, 0
    LDI r12, 0x3000
    LDI r9, 5
    CLIP_TEXT r14, r12, r9

    ; Draw label for step 2
    LDI r6, 2
    LDI r2, 48
    LDI r1, step2_label
    TEXT r6, r2, r1

    ; Paste "World"
    LDI r14, 1
    LDI r12, 0x3100
    LDI r9, 20
    CLIP_TEXT r14, r12, r9
    LDI r6, 2
    LDI r2, 56
    LDI r1, 0x3100
    TEXT r6, r2, r1

    ; Visual indicator bar (yellow = history + new text)
    LDI r11, 0xFFFF00
    LDI r3, 2
    LDI r0, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r14, 2             ; mode: restore
    LDI r12, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r14, r12

    ; Draw label for step 3
    LDI r6, 2
    LDI r2, 80
    LDI r1, step3_label
    TEXT r6, r2, r1

    ; Paste restored text
    LDI r14, 1
    LDI r12, 0x3100
    LDI r9, 20
    CLIP_TEXT r14, r12, r9
    LDI r6, 2
    LDI r2, 88
    LDI r1, 0x3100
    TEXT r6, r2, r1

    ; Visual indicator bar (cyan = restored)
    LDI r11, 0x00FFFF
    LDI r3, 2
    LDI r0, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r10, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r0, 0x3000
    LDI r14, 48            ; '0'
    ADD r14, r10
    STORE r0, r14
    LDI r0, 0x3001
    LDI r14, 0
    STORE r0, r14

    ; Store in text clipboard
    LDI r14, 0
    LDI r12, 0x3000
    LDI r9, 1
    CLIP_TEXT r14, r12, r9

    ; Push to history
    LDI r14, 0
    LDI r12, 0
    CLIP_HISTORY r14, r12

    ADDI r10, 1
    LDI r8, 10
    CMP r10, r8
    BLT r4, fill_loop

    ; Draw label for step 4
    LDI r6, 2
    LDI r2, 112
    LDI r1, step4_label
    TEXT r6, r2, r1

    ; Restore oldest surviving entry (should be "2")
    LDI r14, 2             ; restore
    LDI r12, 7             ; oldest slot
    CLIP_HISTORY r14, r12

    LDI r14, 1
    LDI r12, 0x3100
    LDI r9, 20
    CLIP_TEXT r14, r12, r9
    LDI r6, 2
    LDI r2, 120
    LDI r1, 0x3100
    TEXT r6, r2, r1

    ; Visual indicator bar (magenta = ring buffer)
    LDI r11, 0xFF00FF
    LDI r3, 2
    LDI r0, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r14, 3             ; mode: clear
    LDI r12, 0
    CLIP_HISTORY r14, r12

    ; Draw label for step 5
    LDI r6, 2
    LDI r2, 144
    LDI r1, step5_label
    TEXT r6, r2, r1

    ; Visual indicator bar (white = cleared)
    LDI r11, 0xFFFFFF
    LDI r3, 2
    LDI r0, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r11 = color, r3 = x, r0 = y
draw_bar:
    LDI r15, 40           ; width
bar_loop:
    PSET r3, r0, r11
    ADDI r3, 1
    SUBI r15, 1
    JNZ r15, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
