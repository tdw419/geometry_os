; DESCRIPTION: Composite: Renders a green line between points (385, 101) and (148, 24) then Draws a purple rectangle at (84, 16) with width 51 and height 116.
; PLAN: r0=385(x1), r1=101(y1), r2=148(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=16(y), r7=51(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 101
LDI r2, 148
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 16
LDI r7, 51
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
