; DESCRIPTION: Renders a orange line between points (491, 203) and (502, 50).
; PLAN: r0=491(x1), r1=203(y1), r2=502(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 203
LDI r2, 502
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
