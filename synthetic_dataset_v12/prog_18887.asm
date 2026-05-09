; DESCRIPTION: Composite: Sets a single orange pixel at (417, 7) then Draws a magenta circle centered at (96, 112) with radius 68 then Places a black line segment connecting (346, 188) to (201, 22).
; PLAN: r0=417(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=112(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x1), r11=188(y1), r12=201(x2), r13=22(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 96
LDI r6, 112
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 188
LDI r12, 201
LDI r13, 22
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
