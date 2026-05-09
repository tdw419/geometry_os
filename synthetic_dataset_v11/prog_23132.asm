; DESCRIPTION: Composite: . Then Draws a red rectangle at (108, 185) with width 59 and height 55. Then Places a purple line segment connecting (147, 137) to (77, 131).
; PLAN: r0=108(x), r1=185(y), r2=59(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x1), r1=137(y1), r2=77(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (108, 185) with width 59 and height 55.
; PLAN: r0=108(x), r1=185(y), r2=59(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 185
LDI r2, 59
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (147, 137) to (77, 131).
; PLAN: r0=147(x1), r1=137(y1), r2=77(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 137
LDI r2, 77
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
