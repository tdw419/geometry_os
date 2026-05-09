; DESCRIPTION: Draws a white line from (145, 252) to (125, 73).
; PLAN: r0=145(x1), r1=252(y1), r2=125(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 252
LDI r2, 125
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
