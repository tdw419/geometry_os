; DESCRIPTION: Renders a red line between points (122, 210) and (179, 51).
; PLAN: r0=122(x1), r1=210(y1), r2=179(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 210
LDI r2, 179
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
