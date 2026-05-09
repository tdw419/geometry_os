; DESCRIPTION: Composite: . Then Places a purple line segment connecting (132, 51) to (31, 229). Then Draws a blue rectangle at (72, 40) with width 113 and height 96.
; PLAN: r0=132(x1), r1=51(y1), r2=31(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=40(y), r2=113(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (132, 51) to (31, 229).
; PLAN: r0=132(x1), r1=51(y1), r2=31(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 51
LDI r2, 31
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (72, 40) with width 113 and height 96.
; PLAN: r0=72(x), r1=40(y), r2=113(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 40
LDI r2, 113
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
