; DESCRIPTION: Renders a orange line between points (204, 171) and (356, 184).
; PLAN: r0=204(x1), r1=171(y1), r2=356(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 171
LDI r2, 356
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
