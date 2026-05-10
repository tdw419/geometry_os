; DESCRIPTION: Draws a purple line from (153, 62) to (83, 221).
; PLAN: r0=153(x1), r1=62(y1), r2=83(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 62
LDI r2, 83
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
