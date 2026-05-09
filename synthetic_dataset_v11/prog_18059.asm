; DESCRIPTION: Renders a yellow line between points (160, 83) and (39, 78).
; PLAN: r0=160(x1), r1=83(y1), r2=39(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 83
LDI r2, 39
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
