; DESCRIPTION: Draws a green line from (115, 232) to (100, 121).
; PLAN: r0=115(x1), r1=232(y1), r2=100(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 232
LDI r2, 100
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
