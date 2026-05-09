; DESCRIPTION: Renders a black line between points (118, 133) and (21, 36).
; PLAN: r0=118(x1), r1=133(y1), r2=21(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 133
LDI r2, 21
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
