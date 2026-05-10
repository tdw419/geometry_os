; DESCRIPTION: Composite: Draws a blue line from (422, 162) to (223, 165) then Draws a black rectangle at (142, 163) with width 119 and height 16.
; PLAN: r0=422(x1), r1=162(y1), r2=223(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=163(y), r7=119(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 162
LDI r2, 223
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 163
LDI r7, 119
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
