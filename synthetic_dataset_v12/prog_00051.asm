; DESCRIPTION: Renders a black line between points (481, 104) and (473, 112).
; PLAN: r0=481(x1), r1=104(y1), r2=473(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 104
LDI r2, 473
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
