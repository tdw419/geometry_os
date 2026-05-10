; DESCRIPTION: Composite: Places a magenta line segment connecting (188, 237) to (447, 57) then Renders a black disk with center (130, 177) and radius 49.
; PLAN: r0=188(x1), r1=237(y1), r2=447(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=177(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 237
LDI r2, 447
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 177
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
