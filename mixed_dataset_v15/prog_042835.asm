; DESCRIPTION: Composite: Draws a black rectangle at (28, 101) with width 14 and height 32 then Places a blue line segment connecting (432, 248) to (151, 124).
; PLAN: r0=28(x), r1=101(y), r2=14(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x1), r6=248(y1), r7=151(x2), r8=124(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 101
LDI r2, 14
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 248
LDI r7, 151
LDI r8, 124
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
