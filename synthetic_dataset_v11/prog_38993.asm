; DESCRIPTION: Renders a blue line between points (74, 29) and (23, 51).
; PLAN: r0=74(x1), r1=29(y1), r2=23(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 29
LDI r2, 23
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
