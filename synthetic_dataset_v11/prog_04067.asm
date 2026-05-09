; DESCRIPTION: Renders a yellow line between points (24, 9) and (7, 1).
; PLAN: r0=24(x1), r1=9(y1), r2=7(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 9
LDI r2, 7
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
