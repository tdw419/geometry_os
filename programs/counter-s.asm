; counter-s.asm - counter with labels in single-char micro-asm syntax
;
; Same logic as counter.asm but for the VM-resident micro-assembler.
; Uses #label / @label for branch targets.
;
; OUTPUT:
;   addr 0: I 0 !         LDI r0, 33  (start at '!')
;   addr 3: I 1 $01       LDI r1, 1   (step)
;   addr 6: I 2 $20       LDI r2, 32  (canvas address)
;   addr 9: S 2 0         STORE r2, r0 (label "loop" = 9)
;  addr 12: A 0 1         ADD r0, r1
;  addr 15: B $00 @loop   BRANCH always, target=9
;
; Syntax: letter=opcode, digit=register, $XX=hex, #name=define, @name=resolve
;         ; = comment, space/comma/newline = ignored

I 0 !      ; LDI r0, 33 - start at '!'
I 1 $01    ; LDI r1, 1 - step
I 2 $20    ; LDI r2, 32 - target canvas address (row 1, col 0)
#loop
S 2 0      ; STORE r2, r0 - write counter value to canvas cell
A 0 1      ; ADD r0, r1 - increment
B $00 @loop ; BRANCH cond=0 (always), target=loop
