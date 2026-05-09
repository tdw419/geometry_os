; DESCRIPTION: Renders a orange line between points (403, 74) and (349, 155).
; PLAN: r0=403(x1), r1=74(y1), r2=349(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 74
LDI r2, 349
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
