; DESCRIPTION : Draw s a h or i z on tal re d li ne ac ro s s the m id d le of the screen .

; c ro l l _ de mo . asm -- draw a b right b ar at y = 240 the n s c ro l l it u p war d
; CMP al w ay s w ri t es res ul t into r15 , s o ke e p x in r0 , u se r0 on ly for CMP

LDI r6, 0 ; x counter
LDI r12, 256 ; li m it
LDI r9, 0x00FF00 ; g re en color ( for PSET g re en )

x_loop:
PSET r6, r12, r9 ; p i x el
ADD r6, r9 ; x + +
LDI r1, 0
ADD r1, r13
SUB r1, r9
JZ r1, next_loop
JMP x_loop

next_x:
ADD r6, r9 ; y + +
ADD r11, r9 ; st ri p e p e p i x el counter + +
LDI r1, 0
ADD r1, r11
SUB r1, r9
JNZ r1, check_y
; T o g g le color and re set counter
LDI r1