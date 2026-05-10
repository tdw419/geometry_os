; DESCRIPTION: Composite: Renders a blue line between points (451, 53) and (70, 128) then Draws a purple rectangle at (110, 69) with width 81 and height 109.
; PLAN: r0=451(x1), r1=53(y1), r2=70(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=69(y), r7=81(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 53
LDI r2, 70
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 69
LDI r7, 81
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
