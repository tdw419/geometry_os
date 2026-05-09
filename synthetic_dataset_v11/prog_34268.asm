; DESCRIPTION: Draws a purple line from (29, 184) to (237, 61).
; PLAN: r0=29(x1), r1=184(y1), r2=237(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 184
LDI r2, 237
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
