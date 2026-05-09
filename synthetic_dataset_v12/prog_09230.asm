; DESCRIPTION: Draws a purple line from (494, 225) to (193, 227).
; PLAN: r0=494(x1), r1=225(y1), r2=193(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 225
LDI r2, 193
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
