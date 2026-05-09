; DESCRIPTION: Composite: Draws a blue circle centered at (88, 143) with radius 45 then Renders a yellow line between points (291, 192) and (425, 30).
; PLAN: r0=88(x), r1=143(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x1), r6=192(y1), r7=425(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 143
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 192
LDI r7, 425
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
