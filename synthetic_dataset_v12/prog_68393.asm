; DESCRIPTION: Composite: Renders a orange line between points (22, 55) and (83, 61) then Draws a purple circle centered at (412, 96) with radius 45.
; PLAN: r0=22(x1), r1=55(y1), r2=83(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=96(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 55
LDI r2, 83
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 96
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
