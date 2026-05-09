; DESCRIPTION: Composite: . Then Draws a blue line from (96, 2) to (228, 40). Then Draws a blue rectangle at (72, 216) with width 88 and height 19.
; PLAN: r0=96(x1), r1=2(y1), r2=228(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=72(x), r1=216(y), r2=88(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (96, 2) to (228, 40).
; PLAN: r0=96(x1), r1=2(y1), r2=228(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 2
LDI r2, 228
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (72, 216) with width 88 and height 19.
; PLAN: r0=72(x), r1=216(y), r2=88(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 216
LDI r2, 88
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
