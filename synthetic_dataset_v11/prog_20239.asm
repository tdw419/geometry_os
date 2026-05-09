; DESCRIPTION: Places a magenta line segment connecting (119, 78) to (143, 161).
; PLAN: r0=119(x1), r1=78(y1), r2=143(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 78
LDI r2, 143
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
