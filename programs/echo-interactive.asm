; ═══════════════════════════════════════════════════════════════════════
; programs/echo-interactive.asm
;
; Interactive echo program: type on the keyboard, see characters appear
; on the VM screen. Demonstrates lib/input.gasm read_key routine with
; the memory-mapped keyboard port at 0xFFF.
;
; Uses the TEXT opcode to render characters at a cursor position that
; advances with each keypress. Wraps at screen edge.
;
; Register usage:
;   r0  = keycode (from read_key) / color (for TEXT)
;   r1  = cursor X position
;   r2  = cursor Y position
;   r3  = scratch / char_buf address
;   r4-r7 = temporary (clobbered by read_key)
;
; Memory layout:
;   Code at 0x000 (main loop + input.gasm library)
;   char_buf at 0x300 (one word, overwritten each keypress)
; ═══════════════════════════════════════════════════════════════════════

    ; ── Initialize ──
    LDI r1, 10         ; cursor X = 10
    LDI r2, 10         ; cursor Y = 10
    LDI r3, 0x300      ; char_buf address
    LDI r4, 0
    STORE r3, r4       ; clear char_buf

main_loop:
    ; Wait for a keypress
    CALL read_key

    ; If no key, loop
    LDI r3, 0
    BEQ r0, r3, main_loop

    ; Got a key in r0. Store it in char_buf at 0x300.
    LDI r3, 0x300
    STORE r3, r0

    ; Render the character using TEXT opcode
    ; TEXT takes: r0=color, r1=x, r2=y, str_addr
    PUSH r0             ; save keycode
    LDI r0, 0xFFFFFF   ; white color
    LDI r3, 0x300       ; char_buf address
    TEXT r1, r2, r3
    POP r0              ; restore keycode

    ; Advance cursor X by character width (6 pixels: 5 + 1 gap)
    LDI r3, 6
    ADD r1, r3

    ; Wrap if cursor goes off screen right
    LDI r3, 250
    BLT r1, r3, echo_no_wrap
    LDI r1, 10          ; reset X to left margin
    LDI r3, 8           ; advance Y by line height
    ADD r2, r3
    ; Wrap Y if off bottom
    LDI r3, 250
    BLT r2, r3, echo_no_wrap
    LDI r2, 10          ; reset Y to top

echo_no_wrap:
    JMP main_loop

    ; ── Include the input library ──
    .include "lib/input.gasm"
