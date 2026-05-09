; DESCRIPTION: Draws a yellow line from (232, 102) to (371, 115).
; PLAN: r0=232(x1), r1=102(y1), r2=371(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 102
LDI r2, 371
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
