; DESCRIPTION: Composite: . Then Places a purple line segment connecting (88, 208) to (6, 37). Then Draws a purple rectangle at (9, 107) with width 64 and height 28.
; PLAN: r0=88(x1), r1=208(y1), r2=6(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=107(y), r2=64(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (88, 208) to (6, 37).
; PLAN: r0=88(x1), r1=208(y1), r2=6(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 208
LDI r2, 6
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (9, 107) with width 64 and height 28.
; PLAN: r0=9(x), r1=107(y), r2=64(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 107
LDI r2, 64
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
