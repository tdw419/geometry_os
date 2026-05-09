; DESCRIPTION: Places a magenta line segment connecting (193, 24) to (510, 176).
; PLAN: r0=193(x1), r1=24(y1), r2=510(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 24
LDI r2, 510
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
