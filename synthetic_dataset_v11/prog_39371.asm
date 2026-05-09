; DESCRIPTION: Draws a purple line from (159, 62) to (102, 208).
; PLAN: r0=159(x1), r1=62(y1), r2=102(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 62
LDI r2, 102
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
