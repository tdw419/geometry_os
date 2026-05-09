; DESCRIPTION: Places a purple line segment connecting (19, 247) to (206, 232).
; PLAN: r0=19(x1), r1=247(y1), r2=206(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 247
LDI r2, 206
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
