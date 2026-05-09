; DESCRIPTION: Composite: Places a yellow line segment connecting (213, 174) to (225, 176) then Draws a purple rectangle at (348, 35) with width 97 and height 94.
; PLAN: r0=213(x1), r1=174(y1), r2=225(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=35(y), r7=97(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 174
LDI r2, 225
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 35
LDI r7, 97
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
