; DESCRIPTION: Composite: . Then Places a purple line segment connecting (79, 114) to (111, 216). Then Draws a red rectangle at (102, 67) with width 102 and height 95.
; PLAN: r0=79(x1), r1=114(y1), r2=111(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=67(y), r2=102(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (79, 114) to (111, 216).
; PLAN: r0=79(x1), r1=114(y1), r2=111(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 114
LDI r2, 111
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (102, 67) with width 102 and height 95.
; PLAN: r0=102(x), r1=67(y), r2=102(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 67
LDI r2, 102
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
