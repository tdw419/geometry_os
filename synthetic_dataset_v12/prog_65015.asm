; DESCRIPTION: Renders a yellow line between points (82, 51) and (104, 169).
; PLAN: r0=82(x1), r1=51(y1), r2=104(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 51
LDI r2, 104
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
