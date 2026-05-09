; DESCRIPTION: Renders a yellow line between points (62, 225) and (499, 40).
; PLAN: r0=62(x1), r1=225(y1), r2=499(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 225
LDI r2, 499
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
