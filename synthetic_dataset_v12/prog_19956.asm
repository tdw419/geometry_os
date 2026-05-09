; DESCRIPTION: Draws a yellow line from (385, 232) to (143, 217).
; PLAN: r0=385(x1), r1=232(y1), r2=143(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 232
LDI r2, 143
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
