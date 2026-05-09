; DESCRIPTION: Renders a orange line between points (125, 193) and (181, 173).
; PLAN: r0=125(x1), r1=193(y1), r2=181(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 193
LDI r2, 181
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
