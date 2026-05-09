; DESCRIPTION: Renders a orange line between points (159, 209) and (148, 73).
; PLAN: r0=159(x1), r1=209(y1), r2=148(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 209
LDI r2, 148
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
