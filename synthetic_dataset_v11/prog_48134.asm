; DESCRIPTION: Composite: . Then Places a purple line segment connecting (226, 17) to (51, 213). Then Draws a white rectangle at (145, 29) with width 73 and height 11.
; PLAN: r0=226(x1), r1=17(y1), r2=51(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=145(x), r1=29(y), r2=73(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (226, 17) to (51, 213).
; PLAN: r0=226(x1), r1=17(y1), r2=51(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 17
LDI r2, 51
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (145, 29) with width 73 and height 11.
; PLAN: r0=145(x), r1=29(y), r2=73(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 29
LDI r2, 73
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
