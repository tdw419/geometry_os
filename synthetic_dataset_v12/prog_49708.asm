; DESCRIPTION: Draws a black line from (458, 22) to (125, 35).
; PLAN: r0=458(x1), r1=22(y1), r2=125(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 22
LDI r2, 125
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
