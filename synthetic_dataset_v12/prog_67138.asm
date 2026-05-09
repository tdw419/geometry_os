; DESCRIPTION: Places a orange line segment connecting (101, 243) to (417, 247).
; PLAN: r0=101(x1), r1=243(y1), r2=417(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 243
LDI r2, 417
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
