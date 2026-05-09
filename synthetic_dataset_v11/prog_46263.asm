; DESCRIPTION: Composite: . Then Draws a blue rectangle at (37, 135) with width 88 and height 72. Then Places a purple line segment connecting (151, 64) to (0, 5).
; PLAN: r0=37(x), r1=135(y), r2=88(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x1), r1=64(y1), r2=0(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (37, 135) with width 88 and height 72.
; PLAN: r0=37(x), r1=135(y), r2=88(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 135
LDI r2, 88
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (151, 64) to (0, 5).
; PLAN: r0=151(x1), r1=64(y1), r2=0(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 64
LDI r2, 0
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
