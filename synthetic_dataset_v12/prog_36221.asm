; DESCRIPTION: Renders a orange line between points (113, 238) and (332, 219).
; PLAN: r0=113(x1), r1=238(y1), r2=332(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 238
LDI r2, 332
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
