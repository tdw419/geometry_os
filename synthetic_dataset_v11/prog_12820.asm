; DESCRIPTION: Composite: . Then Places a purple line segment connecting (191, 96) to (19, 227). Then Draws a red rectangle at (5, 237) with width 28 and height 14.
; PLAN: r0=191(x1), r1=96(y1), r2=19(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=237(y), r2=28(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (191, 96) to (19, 227).
; PLAN: r0=191(x1), r1=96(y1), r2=19(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 96
LDI r2, 19
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (5, 237) with width 28 and height 14.
; PLAN: r0=5(x), r1=237(y), r2=28(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 237
LDI r2, 28
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
