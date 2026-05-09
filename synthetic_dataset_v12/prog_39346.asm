; DESCRIPTION: Composite: Places a blue line segment connecting (357, 141) to (234, 200) then Draws a black rectangle at (225, 109) with width 14 and height 12.
; PLAN: r0=357(x1), r1=141(y1), r2=234(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=109(y), r7=14(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 141
LDI r2, 234
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 109
LDI r7, 14
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
