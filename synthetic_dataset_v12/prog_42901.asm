; DESCRIPTION: Renders a yellow line between points (2, 40) and (95, 6).
; PLAN: r0=2(x1), r1=40(y1), r2=95(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 40
LDI r2, 95
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
