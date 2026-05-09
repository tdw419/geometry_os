; DESCRIPTION: Draws a white line from (477, 249) to (125, 35).
; PLAN: r0=477(x1), r1=249(y1), r2=125(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 249
LDI r2, 125
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
