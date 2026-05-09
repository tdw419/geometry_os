; DESCRIPTION: Renders a orange line between points (219, 140) and (426, 115).
; PLAN: r0=219(x1), r1=140(y1), r2=426(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 140
LDI r2, 426
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
