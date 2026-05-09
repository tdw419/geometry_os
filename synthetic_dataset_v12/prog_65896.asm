; DESCRIPTION: Draws a orange line from (389, 72) to (274, 171).
; PLAN: r0=389(x1), r1=72(y1), r2=274(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 72
LDI r2, 274
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
