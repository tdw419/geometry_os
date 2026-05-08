; DESCRIPTION: Render a red object at the screen.

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
    LDI r2, 0
    FILL r2

    ; ── Title bar ──
    LDI r15, 2
    LDI r0, 0
    LDI r8, title
    TEXT r15, r0, r8

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r3, 72            ; 'H'
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 101           ; 'e'
    STORE r9, r3
    LDI r9, 0x3002
    LDI r3, 108           ; 'l'
    STORE r9, r3
    LDI r9, 0x3003
    LDI r3, 108           ; 'l'
    STORE r9, r3
    LDI r9, 0x3004
    LDI r3, 111           ; 'o'
    STORE r9, r3
    LDI r9, 0x3005
    LDI r3, 0             ; null terminator
    STORE r9, r3

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r3, 0             ; mode: store
    LDI r4, 0x3000        ; source addr
    LDI r7, 5             ; length
    CLIP_TEXT r3, r4, r7

    ; Draw label for step 1
    LDI r15, 2
    LDI r0, 16
    LDI r8, step1_label
    TEXT r15, r0, r8

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r3, 1             ; mode: paste
    LDI r4, 0x3100        ; dest addr
    LDI r7, 20            ; max len
    CLIP_TEXT r3, r4, r7
    LDI r15, 2
    LDI r0, 24
    LDI r8, 0x3100
    TEXT r15, r0, r8

    ; Visual indicator bar (green = text stored)
    LDI r6, 0x00FF00
    LDI r10, 2
    LDI r9, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r3, 0             ; mode: push
    LDI r4, 0             ; slot (unused for push)
    CLIP_HISTORY r3, r4

    ; Write "World" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r3, 87            ; 'W'
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 111           ; 'o'
    STORE r9, r3
    LDI r9, 0x3002
    LDI r3, 114           ; 'r'
    STORE r9, r3
    LDI r9, 0x3003
    LDI r3, 108           ; 'l'
    STORE r9, r3
    LDI r9, 0x3004
    LDI r3, 100           ; 'd'
    STORE r9, r3
    LDI r9, 0x3005
    LDI r3, 0
    STORE r9, r3

    ; Store "World" in text clipboard
    LDI r3, 0
    LDI r4, 0x3000
    LDI r7, 5
    CLIP_TEXT r3, r4, r7

    ; Draw label for step 2
    LDI r15, 2
    LDI r0, 48
    LDI r8, step2_label
    TEXT r15, r0, r8

    ; Paste "World"
    LDI r3, 1
    LDI r4, 0x3100
    LDI r7, 20
    CLIP_TEXT r3, r4, r7
    LDI r15, 2
    LDI r0, 56
    LDI r8, 0x3100
    TEXT r15, r0, r8

    ; Visual indicator bar (yellow = history + new text)
    LDI r6, 0xFFFF00
    LDI r10, 2
    LDI r9, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r3, 2             ; mode: restore
    LDI r4, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r3, r4

    ; Draw label for step 3
    LDI r15, 2
    LDI r0, 80
    LDI r8, step3_label
    TEXT r15, r0, r8

    ; Paste restored text
    LDI r3, 1
    LDI r4, 0x3100
    LDI r7, 20
    CLIP_TEXT r3, r4, r7
    LDI r15, 2
    LDI r0, 88
    LDI r8, 0x3100
    TEXT r15, r0, r8

    ; Visual indicator bar (cyan = restored)
    LDI r6, 0x00FFFF
    LDI r10, 2
    LDI r9, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r5, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r9, 0x3000
    LDI r3, 48            ; '0'
    ADD r3, r5
    STORE r9, r3
    LDI r9, 0x3001
    LDI r3, 0
    STORE r9, r3

    ; Store in text clipboard
    LDI r3, 0
    LDI r4, 0x3000
    LDI r7, 1
    CLIP_TEXT r3, r4, r7

    ; Push to history
    LDI r3, 0
    LDI r4, 0
    CLIP_HISTORY r3, r4

    ADDI r5, 1
    LDI r13, 10
    CMP r5, r13
    BLT r2, fill_loop

    ; Draw label for step 4
    LDI r15, 2
    LDI r0, 112
    LDI r8, step4_label
    TEXT r15, r0, r8

    ; Restore oldest surviving entry (should be "2")
    LDI r3, 2             ; restore
    LDI r4, 7             ; oldest slot
    CLIP_HISTORY r3, r4

    LDI r3, 1
    LDI r4, 0x3100
    LDI r7, 20
    CLIP_TEXT r3, r4, r7
    LDI r15, 2
    LDI r0, 120
    LDI r8, 0x3100
    TEXT r15, r0, r8

    ; Visual indicator bar (magenta = ring buffer)
    LDI r6, 0xFF00FF
    LDI r10, 2
    LDI r9, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r3, 3             ; mode: clear
    LDI r4, 0
    CLIP_HISTORY r3, r4

    ; Draw label for step 5
    LDI r15, 2
    LDI r0, 144
    LDI r8, step5_label
    TEXT r15, r0, r8

    ; Visual indicator bar (white = cleared)
    LDI r6, 0xFFFFFF
    LDI r10, 2
    LDI r9, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r6 = color, r10 = x, r9 = y
draw_bar:
    LDI r11, 40           ; width
bar_loop:
    PSET r10, r9, r6
    ADDI r10, 1
    SUBI r11, 1
    JNZ r11, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
