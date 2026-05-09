; DESCRIPTION: Places a magenta line segment connecting (365, 229) to (381, 250).
; PLAN: r0=365(x1), r1=229(y1), r2=381(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 229
LDI r2, 381
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
