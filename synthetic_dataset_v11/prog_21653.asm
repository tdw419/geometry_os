; DESCRIPTION: Composite: . Then Draws a purple line from (216, 59) to (72, 5). Then Creates a yellow rectangular region at (126, 22) spanning 96 by 95 pixels.
; PLAN: r0=216(x1), r1=59(y1), r2=72(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=22(y), r2=96(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (216, 59) to (72, 5).
; PLAN: r0=216(x1), r1=59(y1), r2=72(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 59
LDI r2, 72
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (126, 22) spanning 96 by 95 pixels.
; PLAN: r0=126(x), r1=22(y), r2=96(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 22
LDI r2, 96
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
