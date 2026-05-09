; DESCRIPTION: Renders a orange line between points (422, 203) and (503, 18).
; PLAN: r0=422(x1), r1=203(y1), r2=503(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 203
LDI r2, 503
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
