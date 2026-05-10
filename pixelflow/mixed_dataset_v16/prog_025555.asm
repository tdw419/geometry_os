; DESCRIPTION: Places a magenta line segment connecting (193, 149) to (204, 13).
; PLAN: r0=193(x1), r1=149(y1), r2=204(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 149
LDI r2, 204
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
