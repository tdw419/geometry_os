; DESCRIPTION: Renders a yellow line between points (245, 83) and (3, 94).
; PLAN: r0=245(x1), r1=83(y1), r2=3(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 83
LDI r2, 3
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
