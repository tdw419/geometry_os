; DESCRIPTION: Draws a orange line from (477, 8) to (467, 81).
; PLAN: r0=477(x1), r1=8(y1), r2=467(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 8
LDI r2, 467
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
