; DESCRIPTION: Renders a yellow line between points (388, 46) and (454, 52).
; PLAN: r0=388(x1), r1=46(y1), r2=454(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 46
LDI r2, 454
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
