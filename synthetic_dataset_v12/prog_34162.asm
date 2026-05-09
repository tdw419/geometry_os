; DESCRIPTION: Draws a purple line from (76, 62) to (45, 44).
; PLAN: r0=76(x1), r1=62(y1), r2=45(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 62
LDI r2, 45
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
