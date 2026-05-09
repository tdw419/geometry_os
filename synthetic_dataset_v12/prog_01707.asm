; DESCRIPTION: Draws a orange line from (238, 63) to (167, 142).
; PLAN: r0=238(x1), r1=63(y1), r2=167(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 63
LDI r2, 167
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
