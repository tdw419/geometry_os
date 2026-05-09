; DESCRIPTION: Composite: Sets a single blue pixel at (132, 217) then Places a white circle of radius 32 at center (310, 108) then Places a magenta line segment connecting (106, 62) to (45, 20).
; PLAN: r0=132(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=108(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x1), r11=62(y1), r12=45(x2), r13=20(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 108
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 62
LDI r12, 45
LDI r13, 20
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
