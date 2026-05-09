; DESCRIPTION: Places a magenta line segment connecting (115, 234) to (205, 38).
; PLAN: r0=115(x1), r1=234(y1), r2=205(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 234
LDI r2, 205
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
