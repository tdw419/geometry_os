; DESCRIPTION: Renders a purple line between points (283, 164) and (18, 18).
; PLAN: r0=283(x1), r1=164(y1), r2=18(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 164
LDI r2, 18
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
