; DESCRIPTION: Renders a red line between points (37, 202) and (141, 219).
; PLAN: r0=37(x1), r1=202(y1), r2=141(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 202
LDI r2, 141
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
