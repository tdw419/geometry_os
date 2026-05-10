; DESCRIPTION: Draws a white line from (142, 41) to (105, 149).
; PLAN: r0=142(x1), r1=41(y1), r2=105(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 41
LDI r2, 105
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
