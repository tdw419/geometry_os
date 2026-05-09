; DESCRIPTION: Draws a blue line from (61, 125) to (41, 179).
; PLAN: r0=61(x1), r1=125(y1), r2=41(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 125
LDI r2, 41
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
