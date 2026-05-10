; DESCRIPTION: Draws a green line from (414, 74) to (478, 247).
; PLAN: r0=414(x1), r1=74(y1), r2=478(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 74
LDI r2, 478
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
