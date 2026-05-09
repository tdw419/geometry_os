; DESCRIPTION: Places a magenta line segment connecting (363, 19) to (107, 227).
; PLAN: r0=363(x1), r1=19(y1), r2=107(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 19
LDI r2, 107
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
