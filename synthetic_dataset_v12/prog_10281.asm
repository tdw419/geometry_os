; DESCRIPTION: Draws a black line from (118, 229) to (393, 34).
; PLAN: r0=118(x1), r1=229(y1), r2=393(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 229
LDI r2, 393
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
