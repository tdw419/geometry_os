; DESCRIPTION: Composite: Sets a single yellow pixel at (463, 183) then Renders a cyan disk with center (183, 132) and radius 73 then Places a blue line segment connecting (130, 179) to (38, 145).
; PLAN: r0=463(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=132(y), r7=73(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=130(x1), r11=179(y1), r12=38(x2), r13=145(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 183
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 132
LDI r7, 73
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 130
LDI r11, 179
LDI r12, 38
LDI r13, 145
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
