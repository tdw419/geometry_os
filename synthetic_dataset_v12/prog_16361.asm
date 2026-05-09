; DESCRIPTION: Draws a black line from (223, 75) to (467, 85).
; PLAN: r0=223(x1), r1=75(y1), r2=467(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 75
LDI r2, 467
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
