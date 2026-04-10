; selfwrite-s.asm - self-authoring proof in single-char syntax
;
; This program writes a HALT instruction to address 32 (row 1, col 0
; on the canvas), then jumps to it. The program authors its own
; continuation.
;
; The written program is just HALT, but the principle is:
;   1. Running program edits RAM
;   2. Jumps to the edited RAM
;   3. The edited code executes
;
; Register usage:
;   r0 = write address (32)
;   r1 = value to write (72 = 'H' = HALT opcode)

I 0 $20    ; LDI r0, 32 - target address (canvas cell 32)
I 1 $48    ; LDI r1, 72 - 'H' = HALT opcode (0x48)
E 0 1      ; EDIT_OVERWRITE r0, r1 - write HALT to ram[32]
J $20      ; JMP 32 - jump to the code we just wrote
