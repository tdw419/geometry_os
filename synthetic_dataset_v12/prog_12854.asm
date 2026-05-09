; DESCRIPTION: Composite: Draws a black rectangle at (168, 153) with width 119 and height 51 then Places a green line segment connecting (206, 104) to (464, 148).
; PLAN: r0=168(x), r1=153(y), r2=119(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x1), r6=104(y1), r7=464(x2), r8=148(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 153
LDI r2, 119
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 104
LDI r7, 464
LDI r8, 148
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
