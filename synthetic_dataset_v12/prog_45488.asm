; DESCRIPTION: Renders a orange line between points (503, 5) and (409, 55).
; PLAN: r0=503(x1), r1=5(y1), r2=409(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 5
LDI r2, 409
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
