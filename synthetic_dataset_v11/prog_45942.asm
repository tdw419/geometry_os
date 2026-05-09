; DESCRIPTION: Composite: . Then Draws a purple line from (78, 232) to (95, 18). Then Renders a blue box of size 48x38 starting at (46, 48).
; PLAN: r0=78(x1), r1=232(y1), r2=95(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=48(y), r2=48(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (78, 232) to (95, 18).
; PLAN: r0=78(x1), r1=232(y1), r2=95(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 232
LDI r2, 95
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 48x38 starting at (46, 48).
; PLAN: r0=46(x), r1=48(y), r2=48(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 48
LDI r2, 48
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
