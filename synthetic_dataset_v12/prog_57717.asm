; DESCRIPTION: Places a white line segment connecting (337, 65) to (6, 77).
; PLAN: r0=337(x1), r1=65(y1), r2=6(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 65
LDI r2, 6
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
