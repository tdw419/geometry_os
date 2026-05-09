; DESCRIPTION: Renders a black line between points (464, 219) and (274, 188).
; PLAN: r0=464(x1), r1=219(y1), r2=274(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 219
LDI r2, 274
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
