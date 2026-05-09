; DESCRIPTION: Composite: Renders a orange line between points (198, 73) and (249, 101) then Draws a orange circle centered at (358, 178) with radius 58.
; PLAN: r0=198(x1), r1=73(y1), r2=249(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=178(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 73
LDI r2, 249
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 178
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
