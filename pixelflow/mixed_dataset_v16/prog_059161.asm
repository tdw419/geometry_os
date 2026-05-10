; DESCRIPTION: Draws a yellow line from (115, 164) to (125, 35).
; PLAN: r0=115(x1), r1=164(y1), r2=125(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 164
LDI r2, 125
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
