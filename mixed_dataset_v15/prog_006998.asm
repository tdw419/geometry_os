; DESCRIPTION: Renders a orange line between points (0, 136) and (82, 214).
; PLAN: r0=0(x1), r1=136(y1), r2=82(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 136
LDI r2, 82
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
