; DESCRIPTION: Draws a orange line from (467, 23) to (411, 52).
; PLAN: r0=467(x1), r1=23(y1), r2=411(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 23
LDI r2, 411
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
