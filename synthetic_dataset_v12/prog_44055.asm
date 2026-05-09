; DESCRIPTION: Composite: Draws a purple rectangle at (266, 15) with width 46 and height 56 then Renders a green line between points (423, 43) and (389, 3).
; PLAN: r0=266(x), r1=15(y), r2=46(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=43(y1), r7=389(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 15
LDI r2, 46
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 43
LDI r7, 389
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
