; DESCRIPTION: Composite: Places a blue line segment connecting (153, 93) to (209, 68) then Draws a white rectangle at (423, 25) with width 63 and height 103 then Places a white circle of radius 30 at center (110, 171).
; PLAN: r0=153(x1), r1=93(y1), r2=209(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=25(y), r7=63(width), r8=103(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=171(y), r12=30(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 93
LDI r2, 209
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 25
LDI r7, 63
LDI r8, 103
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 171
LDI r12, 30
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
