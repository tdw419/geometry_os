; DESCRIPTION: Draws a orange line from (311, 111) to (461, 246).
; PLAN: r0=311(x1), r1=111(y1), r2=461(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 111
LDI r2, 461
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
