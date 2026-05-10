; DESCRIPTION: Draws a orange line from (275, 92) to (507, 194).
; PLAN: r0=275(x1), r1=92(y1), r2=507(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 92
LDI r2, 507
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
