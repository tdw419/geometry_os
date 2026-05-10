; DESCRIPTION: Draws a purple line from (232, 184) to (330, 61).
; PLAN: r0=232(x1), r1=184(y1), r2=330(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 184
LDI r2, 330
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
