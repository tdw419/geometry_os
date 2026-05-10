; DESCRIPTION: Places a white line segment connecting (484, 205) to (237, 77).
; PLAN: r0=484(x1), r1=205(y1), r2=237(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 205
LDI r2, 237
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
