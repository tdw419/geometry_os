; DESCRIPTION: Composite: . Then Places a blue line segment connecting (11, 81) to (132, 209). Then Draws a white rectangle at (149, 162) with width 70 and height 66.
; PLAN: r0=11(x1), r1=81(y1), r2=132(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=162(y), r2=70(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (11, 81) to (132, 209).
; PLAN: r0=11(x1), r1=81(y1), r2=132(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 81
LDI r2, 132
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (149, 162) with width 70 and height 66.
; PLAN: r0=149(x), r1=162(y), r2=70(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 162
LDI r2, 70
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
