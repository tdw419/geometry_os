; DESCRIPTION: Draws a orange line from (164, 138) to (238, 191).
; PLAN: r0=164(x1), r1=138(y1), r2=238(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 138
LDI r2, 238
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
