; DESCRIPTION: Renders a orange line between points (109, 171) and (176, 225).
; PLAN: r0=109(x1), r1=171(y1), r2=176(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 171
LDI r2, 176
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
