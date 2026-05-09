; DESCRIPTION: Draws a purple line from (436, 167) to (45, 247).
; PLAN: r0=436(x1), r1=167(y1), r2=45(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 167
LDI r2, 45
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
