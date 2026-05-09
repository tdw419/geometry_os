; DESCRIPTION: Renders a yellow line between points (51, 59) and (10, 3).
; PLAN: r0=51(x1), r1=59(y1), r2=10(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 59
LDI r2, 10
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
