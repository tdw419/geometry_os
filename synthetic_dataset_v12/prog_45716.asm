; DESCRIPTION: Renders a yellow line between points (135, 83) and (211, 135).
; PLAN: r0=135(x1), r1=83(y1), r2=211(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 83
LDI r2, 211
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
