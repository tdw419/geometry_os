; DESCRIPTION: Places a magenta line segment connecting (365, 105) to (331, 14).
; PLAN: r0=365(x1), r1=105(y1), r2=331(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 105
LDI r2, 331
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
