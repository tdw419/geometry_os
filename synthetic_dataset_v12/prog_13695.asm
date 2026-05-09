; DESCRIPTION: Draws a black line from (162, 171) to (483, 191).
; PLAN: r0=162(x1), r1=171(y1), r2=483(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 171
LDI r2, 483
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
