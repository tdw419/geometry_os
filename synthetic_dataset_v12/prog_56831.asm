; DESCRIPTION: Composite: Renders a black line between points (329, 58) and (376, 14) then Draws a blue rectangle at (51, 188) with width 114 and height 11.
; PLAN: r0=329(x1), r1=58(y1), r2=376(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=188(y), r7=114(width), r8=11(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 58
LDI r2, 376
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 188
LDI r7, 114
LDI r8, 11
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
