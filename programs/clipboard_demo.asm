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
    LDI r0, 0
    FILL r0

    ; ── Title bar ──
    LDI r10, 2
    LDI r11, 0
    LDI r12, title
    TEXT r10, r11, r12

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r1, 72            ; 'H'
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 101           ; 'e'
    STORE r9, r1
    LDI r9, 0x3002
    LDI r1, 108           ; 'l'
    STORE r9, r1
    LDI r9, 0x3003
    LDI r1, 108           ; 'l'
    STORE r9, r1
    LDI r9, 0x3004
    LDI r1, 111           ; 'o'
    STORE r9, r1
    LDI r9, 0x3005
    LDI r1, 0             ; null terminator
    STORE r9, r1

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r1, 0             ; mode: store
    LDI r2, 0x3000        ; source addr
    LDI r3, 5             ; length
    CLIP_TEXT r1, r2, r3

    ; Draw label for step 1
    LDI r10, 2
    LDI r11, 16
    LDI r12, step1_label
    TEXT r10, r11, r12

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r1, 1             ; mode: paste
    LDI r2, 0x3100        ; dest addr
    LDI r3, 20            ; max len
    CLIP_TEXT r1, r2, r3
    LDI r10, 2
    LDI r11, 24
    LDI r12, 0x3100
    TEXT r10, r11, r12

    ; Visual indicator bar (green = text stored)
    LDI r7, 0x00FF00
    LDI r8, 2
    LDI r9, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r1, 0             ; mode: push
    LDI r2, 0             ; slot (unused for push)
    CLIP_HISTORY r1, r2

    ; Write "World" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r1, 87            ; 'W'
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 111           ; 'o'
    STORE r9, r1
    LDI r9, 0x3002
    LDI r1, 114           ; 'r'
    STORE r9, r1
    LDI r9, 0x3003
    LDI r1, 108           ; 'l'
    STORE r9, r1
    LDI r9, 0x3004
    LDI r1, 100           ; 'd'
    STORE r9, r1
    LDI r9, 0x3005
    LDI r1, 0
    STORE r9, r1

    ; Store "World" in text clipboard
    LDI r1, 0
    LDI r2, 0x3000
    LDI r3, 5
    CLIP_TEXT r1, r2, r3

    ; Draw label for step 2
    LDI r10, 2
    LDI r11, 48
    LDI r12, step2_label
    TEXT r10, r11, r12

    ; Paste "World"
    LDI r1, 1
    LDI r2, 0x3100
    LDI r3, 20
    CLIP_TEXT r1, r2, r3
    LDI r10, 2
    LDI r11, 56
    LDI r12, 0x3100
    TEXT r10, r11, r12

    ; Visual indicator bar (yellow = history + new text)
    LDI r7, 0xFFFF00
    LDI r8, 2
    LDI r9, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r1, 2             ; mode: restore
    LDI r2, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r1, r2

    ; Draw label for step 3
    LDI r10, 2
    LDI r11, 80
    LDI r12, step3_label
    TEXT r10, r11, r12

    ; Paste restored text
    LDI r1, 1
    LDI r2, 0x3100
    LDI r3, 20
    CLIP_TEXT r1, r2, r3
    LDI r10, 2
    LDI r11, 88
    LDI r12, 0x3100
    TEXT r10, r11, r12

    ; Visual indicator bar (cyan = restored)
    LDI r7, 0x00FFFF
    LDI r8, 2
    LDI r9, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r15, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r9, 0x3000
    LDI r1, 48            ; '0'
    ADD r1, r15
    STORE r9, r1
    LDI r9, 0x3001
    LDI r1, 0
    STORE r9, r1

    ; Store in text clipboard
    LDI r1, 0
    LDI r2, 0x3000
    LDI r3, 1
    CLIP_TEXT r1, r2, r3

    ; Push to history
    LDI r1, 0
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ADDI r15, 1
    LDI r14, 10
    CMP r15, r14
    BLT r0, fill_loop

    ; Draw label for step 4
    LDI r10, 2
    LDI r11, 112
    LDI r12, step4_label
    TEXT r10, r11, r12

    ; Restore oldest surviving entry (should be "2")
    LDI r1, 2             ; restore
    LDI r2, 7             ; oldest slot
    CLIP_HISTORY r1, r2

    LDI r1, 1
    LDI r2, 0x3100
    LDI r3, 20
    CLIP_TEXT r1, r2, r3
    LDI r10, 2
    LDI r11, 120
    LDI r12, 0x3100
    TEXT r10, r11, r12

    ; Visual indicator bar (magenta = ring buffer)
    LDI r7, 0xFF00FF
    LDI r8, 2
    LDI r9, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r1, 3             ; mode: clear
    LDI r2, 0
    CLIP_HISTORY r1, r2

    ; Draw label for step 5
    LDI r10, 2
    LDI r11, 144
    LDI r12, step5_label
    TEXT r10, r11, r12

    ; Visual indicator bar (white = cleared)
    LDI r7, 0xFFFFFF
    LDI r8, 2
    LDI r9, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r7 = color, r8 = x, r9 = y
draw_bar:
    LDI r13, 40           ; width
bar_loop:
    PSET r8, r9, r7
    ADDI r8, 1
    SUBI r13, 1
    JNZ r13, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
