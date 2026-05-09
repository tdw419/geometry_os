; DESCRIPTION: Draws a green line from (41, 142) to (250, 175).
; PLAN: r0=41(x1), r1=142(y1), r2=250(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 142
LDI r2, 250
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
