; DESCRIPTION: Draws a red object at the screen with fixed size.

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
    LDI r14, 2
    LDI r8, 0
    LDI r4, title
    TEXT r14, r8, r4

    ; ═══════════════════════════════════════════
    ; STEP 1: Text clipboard — store "Hello"
    ; ═══════════════════════════════════════════
    ; Write "Hello" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r15, 72            ; 'H'
    STORE r9, r15
    LDI r9, 0x3001
    LDI r15, 101           ; 'e'
    STORE r9, r15
    LDI r9, 0x3002
    LDI r15, 108           ; 'l'
    STORE r9, r15
    LDI r9, 0x3003
    LDI r15, 108           ; 'l'
    STORE r9, r15
    LDI r9, 0x3004
    LDI r15, 111           ; 'o'
    STORE r9, r15
    LDI r9, 0x3005
    LDI r15, 0             ; null terminator
    STORE r9, r15

    ; CLIP_TEXT mode=0 (store), addr=0x3000, len=5
    LDI r15, 0             ; mode: store
    LDI r3, 0x3000        ; source addr
    LDI r12, 5             ; length
    CLIP_TEXT r15, r3, r12

    ; Draw label for step 1
    LDI r14, 2
    LDI r8, 16
    LDI r4, step1_label
    TEXT r14, r8, r4

    ; Paste "Hello" from text clipboard to 0x3100, then draw
    LDI r15, 1             ; mode: paste
    LDI r3, 0x3100        ; dest addr
    LDI r12, 20            ; max len
    CLIP_TEXT r15, r3, r12
    LDI r14, 2
    LDI r8, 24
    LDI r4, 0x3100
    TEXT r14, r8, r4

    ; Visual indicator bar (green = text stored)
    LDI r5, 0x00FF00
    LDI r10, 2
    LDI r9, 32
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 2: Push to history, store "World"
    ; ═══════════════════════════════════════════
    ; Push current clipboard state to history
    LDI r15, 0             ; mode: push
    LDI r3, 0             ; slot (unused for push)
    CLIP_HISTORY r15, r3

    ; Write "World" to RAM at 0x3000
    LDI r9, 0x3000
    LDI r15, 87            ; 'W'
    STORE r9, r15
    LDI r9, 0x3001
    LDI r15, 111           ; 'o'
    STORE r9, r15
    LDI r9, 0x3002
    LDI r15, 114           ; 'r'
    STORE r9, r15
    LDI r9, 0x3003
    LDI r15, 108           ; 'l'
    STORE r9, r15
    LDI r9, 0x3004
    LDI r15, 100           ; 'd'
    STORE r9, r15
    LDI r9, 0x3005
    LDI r15, 0
    STORE r9, r15

    ; Store "World" in text clipboard
    LDI r15, 0
    LDI r3, 0x3000
    LDI r12, 5
    CLIP_TEXT r15, r3, r12

    ; Draw label for step 2
    LDI r14, 2
    LDI r8, 48
    LDI r4, step2_label
    TEXT r14, r8, r4

    ; Paste "World"
    LDI r15, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r15, r3, r12
    LDI r14, 2
    LDI r8, 56
    LDI r4, 0x3100
    TEXT r14, r8, r4

    ; Visual indicator bar (yellow = history + new text)
    LDI r5, 0xFFFF00
    LDI r10, 2
    LDI r9, 64
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 3: Restore "Hello" from history
    ; ═══════════════════════════════════════════
    LDI r15, 2             ; mode: restore
    LDI r3, 0             ; slot 0 = newest = "Hello"
    CLIP_HISTORY r15, r3

    ; Draw label for step 3
    LDI r14, 2
    LDI r8, 80
    LDI r4, step3_label
    TEXT r14, r8, r4

    ; Paste restored text
    LDI r15, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r15, r3, r12
    LDI r14, 2
    LDI r8, 88
    LDI r4, 0x3100
    TEXT r14, r8, r4

    ; Visual indicator bar (cyan = restored)
    LDI r5, 0x00FFFF
    LDI r10, 2
    LDI r9, 96
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 4: Fill history ring buffer (10 pushes)
    ; ═══════════════════════════════════════════
    LDI r7, 0            ; loop counter

fill_loop:
    ; Store counter as text digit "0"-"9"
    LDI r9, 0x3000
    LDI r15, 48            ; '0'
    ADD r15, r7
    STORE r9, r15
    LDI r9, 0x3001
    LDI r15, 0
    STORE r9, r15

    ; Store in text clipboard
    LDI r15, 0
    LDI r3, 0x3000
    LDI r12, 1
    CLIP_TEXT r15, r3, r12

    ; Push to history
    LDI r15, 0
    LDI r3, 0
    CLIP_HISTORY r15, r3

    ADDI r7, 1
    LDI r1, 10
    CMP r7, r1
    BLT r0, fill_loop

    ; Draw label for step 4
    LDI r14, 2
    LDI r8, 112
    LDI r4, step4_label
    TEXT r14, r8, r4

    ; Restore oldest surviving entry (should be "2")
    LDI r15, 2             ; restore
    LDI r3, 7             ; oldest slot
    CLIP_HISTORY r15, r3

    LDI r15, 1
    LDI r3, 0x3100
    LDI r12, 20
    CLIP_TEXT r15, r3, r12
    LDI r14, 2
    LDI r8, 120
    LDI r4, 0x3100
    TEXT r14, r8, r4

    ; Visual indicator bar (magenta = ring buffer)
    LDI r5, 0xFF00FF
    LDI r10, 2
    LDI r9, 128
    CALL draw_bar

    ; ═══════════════════════════════════════════
    ; STEP 5: Clear history
    ; ═══════════════════════════════════════════
    LDI r15, 3             ; mode: clear
    LDI r3, 0
    CLIP_HISTORY r15, r3

    ; Draw label for step 5
    LDI r14, 2
    LDI r8, 144
    LDI r4, step5_label
    TEXT r14, r8, r4

    ; Visual indicator bar (white = cleared)
    LDI r5, 0xFFFFFF
    LDI r10, 2
    LDI r9, 160
    CALL draw_bar

    ; ── Done ──
    HALT

; ── Draw a 40-pixel wide indicator bar ──
; r5 = color, r10 = x, r9 = y
draw_bar:
    LDI r2, 40           ; width
bar_loop:
    PSET r10, r9, r5
    ADDI r10, 1
    SUBI r2, 1
    JNZ r2, bar_loop
    RET

; ── Data ──
title:       .asciz "Phase 221: Clipboard Demo"
step1_label: .asciz "1) Text: "
step2_label: .asciz "2) Push + World: "
step3_label: .asciz "3) Restore Hello: "
step4_label: .asciz "4) Ring(10->8), oldest: "
step5_label: .asciz "5) History cleared"
