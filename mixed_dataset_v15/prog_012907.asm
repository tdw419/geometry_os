; DESCRIPTION: Composite: Places a magenta line segment connecting (125, 164) to (313, 158) then Draws a yellow rectangle at (110, 171) with width 33 and height 85.
; PLAN: r0=125(x1), r1=164(y1), r2=313(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=171(y), r7=33(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 164
LDI r2, 313
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 171
LDI r7, 33
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
