; DESCRIPTION: Renders a green line between points (12, 219) and (8, 137).
; PLAN: r0=12(x1), r1=219(y1), r2=8(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 219
LDI r2, 8
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
