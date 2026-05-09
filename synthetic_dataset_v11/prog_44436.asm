; DESCRIPTION: Renders a orange line between points (241, 174) and (223, 134).
; PLAN: r0=241(x1), r1=174(y1), r2=223(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 174
LDI r2, 223
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
