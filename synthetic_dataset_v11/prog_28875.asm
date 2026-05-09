; DESCRIPTION: Composite: . Then Places a white circle of radius 62 at center (162, 88). Then Places a magenta line segment connecting (79, 59) to (158, 94).
; PLAN: r0=162(x), r1=88(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x1), r1=59(y1), r2=158(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 62 at center (162, 88).
; PLAN: r0=162(x), r1=88(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 88
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (79, 59) to (158, 94).
; PLAN: r0=79(x1), r1=59(y1), r2=158(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 59
LDI r2, 158
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
