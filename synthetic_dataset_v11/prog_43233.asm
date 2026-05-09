; DESCRIPTION: Renders a red line between points (14, 45) and (121, 237).
; PLAN: r0=14(x1), r1=45(y1), r2=121(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 45
LDI r2, 121
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
