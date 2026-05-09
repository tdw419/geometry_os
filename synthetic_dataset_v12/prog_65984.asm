; DESCRIPTION: Places a green line segment connecting (150, 118) to (36, 77).
; PLAN: r0=150(x1), r1=118(y1), r2=36(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 118
LDI r2, 36
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
