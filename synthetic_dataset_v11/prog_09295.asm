; DESCRIPTION: Draws a yellow line from (37, 227) to (19, 152).
; PLAN: r0=37(x1), r1=227(y1), r2=19(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 227
LDI r2, 19
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
