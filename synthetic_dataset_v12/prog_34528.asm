; DESCRIPTION: Renders a green line between points (219, 232) and (426, 205).
; PLAN: r0=219(x1), r1=232(y1), r2=426(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 232
LDI r2, 426
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
