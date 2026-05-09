; DESCRIPTION: Renders a yellow line between points (271, 49) and (227, 11).
; PLAN: r0=271(x1), r1=49(y1), r2=227(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 49
LDI r2, 227
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
