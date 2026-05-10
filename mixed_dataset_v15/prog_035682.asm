; DESCRIPTION: Composite: Renders a cyan line between points (198, 29) and (454, 185) then Draws a black rectangle at (364, 155) with width 100 and height 74.
; PLAN: r0=198(x1), r1=29(y1), r2=454(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=155(y), r7=100(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 29
LDI r2, 454
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 155
LDI r7, 100
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
