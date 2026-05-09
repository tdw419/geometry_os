; DESCRIPTION: Places a magenta line segment connecting (439, 136) to (301, 65).
; PLAN: r0=439(x1), r1=136(y1), r2=301(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 136
LDI r2, 301
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
