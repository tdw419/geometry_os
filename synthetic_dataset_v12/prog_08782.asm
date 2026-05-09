; DESCRIPTION: Composite: Draws a purple rectangle at (44, 12) with width 33 and height 31 then Draws a blue line from (455, 203) to (359, 112).
; PLAN: r0=44(x), r1=12(y), r2=33(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x1), r6=203(y1), r7=359(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 12
LDI r2, 33
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 203
LDI r7, 359
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
