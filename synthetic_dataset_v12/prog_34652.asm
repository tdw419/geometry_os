; DESCRIPTION: Renders a green line between points (338, 140) and (463, 122).
; PLAN: r0=338(x1), r1=140(y1), r2=463(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 140
LDI r2, 463
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
