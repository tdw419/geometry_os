; DESCRIPTION: Places a magenta line segment connecting (37, 193) to (176, 251).
; PLAN: r0=37(x1), r1=193(y1), r2=176(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 193
LDI r2, 176
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
