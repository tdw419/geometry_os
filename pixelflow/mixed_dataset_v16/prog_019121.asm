; DESCRIPTION: Composite: Renders a blue line between points (53, 209) and (56, 67) then Draws a black circle centered at (334, 64) with radius 37 then Sets a single orange pixel at (260, 128).
; PLAN: r0=53(x1), r1=209(y1), r2=56(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=64(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x), r11=128(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 209
LDI r2, 56
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 64
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 128
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
