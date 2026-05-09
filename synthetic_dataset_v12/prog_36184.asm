; DESCRIPTION: Renders a red line between points (310, 188) and (402, 184).
; PLAN: r0=310(x1), r1=188(y1), r2=402(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 188
LDI r2, 402
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
