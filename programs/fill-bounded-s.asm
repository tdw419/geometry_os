; fill-bounded-s.asm - fill 64 cells then HALT
;
; Demonstrates conditional branching via extended hex ($XXXXXXXX).
; Requires micro-asm level 1 (label support + 8-digit hex).
;
; r0 = output ptr (starts at 64, past the ~28-cell program body)
; r1 = iteration counter
; r2 = limit (64)
; r3 = value ('A' = 65)
; r4 = 1 (increment)
;
; BNE r1,r2 condition pixel:
;   cond=1 | r1_ascii(0x31)<<16 | r2_ascii(0x32)<<24 = 0x32310001
;
; Output: RAM[64..127] = 65, then HALT

I 0 $40  ; LDI r0, 64
I 1 $00  ; LDI r1, 0
I 2 $40  ; LDI r2, 64
I 3 A    ; LDI r3, 65 ('A')
I 4 $01  ; LDI r4, 1
#loop
S 0 3    ; STORE r0, r3
A 0 4    ; ADD r0, r4
A 1 4    ; ADD r1, r4
B $32310001 @loop  ; BNE r1, r2 -> loop
H        ; HALT
