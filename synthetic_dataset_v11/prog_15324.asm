; DESCRIPTION: Composite: . Then Places a purple line segment connecting (17, 89) to (223, 3). Then Draws a magenta rectangle at (131, 90) with width 72 and height 112.
; PLAN: r0=17(x1), r1=89(y1), r2=223(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=90(y), r2=72(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (17, 89) to (223, 3).
; PLAN: r0=17(x1), r1=89(y1), r2=223(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 89
LDI r2, 223
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (131, 90) with width 72 and height 112.
; PLAN: r0=131(x), r1=90(y), r2=72(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 90
LDI r2, 72
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
