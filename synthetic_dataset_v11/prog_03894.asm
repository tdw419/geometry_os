; DESCRIPTION: Renders a yellow line between points (12, 241) and (12, 7).
; PLAN: r0=12(x1), r1=241(y1), r2=12(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 241
LDI r2, 12
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
