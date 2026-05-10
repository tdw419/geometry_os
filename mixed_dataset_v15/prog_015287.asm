; DESCRIPTION: Composite: Draws a blue circle centered at (78, 88) with radius 36 then Draws a black line from (192, 218) to (459, 227).
; PLAN: r0=78(x), r1=88(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=218(y1), r7=459(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 88
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 218
LDI r7, 459
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
