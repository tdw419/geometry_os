; DESCRIPTION: Renders a green line between points (204, 222) and (244, 137).
; PLAN: r0=204(x1), r1=222(y1), r2=244(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 222
LDI r2, 244
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
