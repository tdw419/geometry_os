; fill-s.asm - sweep canvas with ascending values (infinite loop)
;
; Writes ascending printable characters to consecutive canvas cells.
; Runs as an infinite loop - press F5 to stop.
;
; Register usage:
;   r0 = value (starts at '!' = 33)
;   r1 = 1 (step)
;   r2 = canvas address pointer (starts at 0)
;
; NOTE: Conditional branches with r1!=r0 are not possible in
; single-char syntax (condition byte can't encode register indices
; in bits 16-31). Only BEQ r0,r0 ($00) and BAL ($0F) are available.

I 0 $21    ; LDI r0, 33 - first printable '!'
I 1 $01    ; LDI r1, 1 - step
I 2 $00    ; LDI r2, 0 - canvas address
#loop
S 2 0      ; STORE [r2], r0 - write value to canvas
A 0 1      ; ADD r0, r1 - next character value
A 2 1      ; ADD r2, r1 - next canvas cell
B $00 @loop ; BEQ r0,r0 = always branch to loop
H          ; safety halt (never reached)
