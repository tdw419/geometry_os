; DESCRIPTION: Draws a purple line from (31, 241) to (24, 202).
; PLAN: r0=31(x1), r1=241(y1), r2=24(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 241
LDI r2, 24
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
