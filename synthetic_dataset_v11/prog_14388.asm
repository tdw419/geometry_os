; DESCRIPTION: Renders a yellow line between points (226, 1) and (7, 6).
; PLAN: r0=226(x1), r1=1(y1), r2=7(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 1
LDI r2, 7
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
