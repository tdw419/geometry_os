; DESCRIPTION: Renders a black line between points (1, 162) and (182, 51).
; PLAN: r0=1(x1), r1=162(y1), r2=182(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 162
LDI r2, 182
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
