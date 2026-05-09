; DESCRIPTION: Draws a orange line from (167, 45) to (467, 127).
; PLAN: r0=167(x1), r1=45(y1), r2=467(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 45
LDI r2, 467
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
