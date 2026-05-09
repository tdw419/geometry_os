; DESCRIPTION: Composite: Renders a blue line between points (160, 114) and (256, 234) then Draws a blue rectangle at (199, 178) with width 118 and height 69.
; PLAN: r0=160(x1), r1=114(y1), r2=256(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=178(y), r7=118(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 114
LDI r2, 256
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 178
LDI r7, 118
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
