; DESCRIPTION: Renders a orange line between points (407, 171) and (403, 121).
; PLAN: r0=407(x1), r1=171(y1), r2=403(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 171
LDI r2, 403
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
