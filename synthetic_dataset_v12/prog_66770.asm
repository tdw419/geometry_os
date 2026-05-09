; DESCRIPTION: Composite: Draws a blue line from (425, 119) to (88, 58) then Draws a blue circle centered at (172, 137) with radius 36.
; PLAN: r0=425(x1), r1=119(y1), r2=88(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=137(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 119
LDI r2, 88
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 137
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
