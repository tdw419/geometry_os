; DESCRIPTION: Renders a orange line between points (208, 204) and (300, 214).
; PLAN: r0=208(x1), r1=204(y1), r2=300(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 204
LDI r2, 300
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
