; DESCRIPTION: Renders a orange line between points (219, 88) and (252, 184).
; PLAN: r0=219(x1), r1=88(y1), r2=252(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 88
LDI r2, 252
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
