; DESCRIPTION: Renders a yellow line between points (383, 87) and (97, 45).
; PLAN: r0=383(x1), r1=87(y1), r2=97(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 87
LDI r2, 97
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
