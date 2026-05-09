; DESCRIPTION: Renders a yellow line between points (3, 51) and (196, 28).
; PLAN: r0=3(x1), r1=51(y1), r2=196(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 51
LDI r2, 196
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
