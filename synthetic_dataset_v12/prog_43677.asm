; DESCRIPTION: Draws a green line from (55, 122) to (36, 212).
; PLAN: r0=55(x1), r1=122(y1), r2=36(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 122
LDI r2, 36
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
