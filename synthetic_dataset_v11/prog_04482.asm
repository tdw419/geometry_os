; DESCRIPTION: Renders a yellow line between points (211, 90) and (204, 61).
; PLAN: r0=211(x1), r1=90(y1), r2=204(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 90
LDI r2, 204
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
