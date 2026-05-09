; DESCRIPTION: Draws a black line from (171, 89) to (37, 229).
; PLAN: r0=171(x1), r1=89(y1), r2=37(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 89
LDI r2, 37
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
