; DESCRIPTION: Places a magenta line segment connecting (158, 173) to (359, 77).
; PLAN: r0=158(x1), r1=173(y1), r2=359(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 173
LDI r2, 359
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
