; DESCRIPTION: Renders a orange line between points (181, 136) and (164, 234).
; PLAN: r0=181(x1), r1=136(y1), r2=164(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 136
LDI r2, 164
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
