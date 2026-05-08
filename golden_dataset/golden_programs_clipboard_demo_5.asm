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
    LDI r11, 0
    FILL r11

    ; ── Title bar ──
    LDI r7, 2
    LDI r14, 0
    LDI r8, title
    TEXT r7, r14, r8

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r9, 72            ; 'H'
    STORE r0, r9
    LDI r0, 0x3001
    LDI r9, 101           ; 'e'
    STORE r0, r9
    LDI r0, 0x3002
    LDI r9, 108           ; 'l'
    STORE r0, r9
    LDI r0, 0x3003
    LDI r9, 108           ; 'l'
    STORE r0, r9
    LDI r0, 0x3004
    LDI r9, 111           ; 'o'
    STORE r0, r9
    LDI r0, 0x3005
    LDI r9, 0             ; null terminator
    STORE r0, r9

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r9, 0             ; mode: store
    LDI r2, 0x3000        ; source addr
    LDI r1, 5             ; length
    CLIP_TEXT r9, r2, r1

    ; Draw label for step 1
    LDI r7, 2
    LDI r14, 16
    LDI r8, step1_label
    TEXT r7, r14, r8

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r9, 1             ; mode: paste
    LDI r2, 0x3100        ; dest addr
    LDI r1, 20            ; max len
    CLIP_TEXT r9, r2, r1
    LDI r7, 2
    LDI r14, 24
    LDI r8, 0x3100
    TEXT r7, r14, r8

    ; Visual indicator bar (green = text stored)
    LDI r5, 0x00FF00
    LDI r12, 2
    LDI r0, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r9, 0             ; mode: push
    LDI r2, 0             ; slot (unused for push)
    CLIP_HISTORY r9, r2

    ; Write "World" to RAM at 0x3000
    LDI r0, 0x3000
    LDI r9, 87            ; 'W'
    STORE r0, r9
    LDI r0, 0x3001
    LDI r9, 111           ; 'o'
    STORE r0, r9
    LDI r0, 0x3002
    LDI r9, 114           ; 'r'
    STORE r0, r9
    LDI r0, 0x3003
    LDI r9, 108           ; 'l'
    STORE r0, r9
    LDI r0, 0x3004
    LDI r9, 100           ; 'd'
    STORE r0, r9
    LDI r0, 0x3005
    LDI r9, 0
    STORE r0, r9

    ; Store "World" in text clipboard
    LDI r9, 0
    LDI r2, 0x3000
    LDI r1, 5
    CLIP_TEXT r9, r2, r1

    ; Draw label for step 2
    LDI r7, 2
    LDI r14, 48
    LDI r8, step2_label
    TEXT r7, r14, r8

    ; Paste "World"
    LDI r9, 1
    LDI r2, 0x3100
    LDI r1, 20
    CLIP_TEXT r9, r2, r1
    LDI r7, 2
    LDI r14, 56
    LDI r8, 0x3100
    TEXT r7, r14, r8

    ; Visual indicator bar (yellow = history + new text)
    LDI r5, 0xFFFF00
    LDI r12, 2
    LDI r0, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r9, 2             ; mode: restore
    LDI r2, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r9, r2

    ; Draw label for step 3
    LDI r7, 2
    LDI r14, 80
    LDI r8, step3_label
    TEXT r7, r14, r8

    ; Paste restored text
    LDI r9, 1
    LDI r2, 0x3100
    LDI r1, 20
    CLIP_TEXT r9, r2, r1
    LDI r7, 2
    LDI r14, 88
    LDI r8, 0x3100
    TEXT r7, r14, r8

    ; Visual indicator bar (cyan = restored)
    LDI r5, 0x00FFFF
    LDI r12, 2
    LDI r0, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r6, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r0, 0x3000
    LDI r9, 48            ; '0'
    ADD r9, r6
    STORE r0, r9
    LDI r0, 0x3001
    LDI r9, 0
    STORE r0, r9

    ; Store in text clipboard
    LDI r9, 0
    LDI r2, 0x3000
    LDI r1, 1
    CLIP_TEXT r9, r2, r1

    ; Push to history
    LDI r9, 0
    LDI r2, 0
    CLIP_HISTORY r9, r2

    ADDI r6, 1
    LDI r3, 10
    CMP r6, r3
    BLT r11, fill_loop

    ; Draw label for step 4
    LDI r7, 2
    LDI r14, 112
    LDI r8, step4_label
    TEXT r7, r14, r8

    ; Restore oldest surviving entry (should be "2")
    LDI r9, 2             ; restore
    LDI r2, 7             ; oldest slot
    CLIP_HISTORY r9, r2

    LDI r9, 1
    LDI r2, 0x3100
    LDI r1, 20
    CLIP_TEXT r9, r2, r1
    LDI r7, 2
    LDI r14, 120
    LDI r8, 0x3100
    TEXT r7, r14, r8

    ; Visual indicator bar (magenta = ring buffer)
    LDI r5, 0xFF00FF
    LDI r12, 2
    LDI r0, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r9, 3             ; mode: clear
    LDI r2, 0
    CLIP_HISTORY r9, r2

    ; Draw label for step 5
    LDI r7, 2
    LDI r14, 144
    LDI r8, step5_label
    TEXT r7, r14, r8

    ; Visual indicator bar (white = cleared)
    LDI r5, 0xFFFFFF
    LDI r12, 2
    LDI r0, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r5 = color, r12 = x, r0 = y
draw_bar:
    LDI r13, 40           ; width
bar_loop:
    PSET r12, r0, r5
    ADDI r12, 1
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
