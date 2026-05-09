; DESCRIPTION: Renders a orange line between points (10, 204) and (215, 239).
; PLAN: r0=10(x1), r1=204(y1), r2=215(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 204
LDI r2, 215
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
