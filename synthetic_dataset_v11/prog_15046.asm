; DESCRIPTION: Places a magenta line segment connecting (40, 247) to (151, 77).
; PLAN: r0=40(x1), r1=247(y1), r2=151(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 247
LDI r2, 151
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
