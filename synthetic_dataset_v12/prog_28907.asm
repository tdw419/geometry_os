; DESCRIPTION: Renders a orange line between points (488, 11) and (409, 81).
; PLAN: r0=488(x1), r1=11(y1), r2=409(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 11
LDI r2, 409
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
