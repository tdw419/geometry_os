; DESCRIPTION: Draws a orange line from (134, 129) to (247, 112).
; PLAN: r0=134(x1), r1=129(y1), r2=247(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 129
LDI r2, 247
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
