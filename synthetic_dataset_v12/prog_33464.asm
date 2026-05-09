; DESCRIPTION: Renders a blue line between points (399, 83) and (223, 115).
; PLAN: r0=399(x1), r1=83(y1), r2=223(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 83
LDI r2, 223
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
