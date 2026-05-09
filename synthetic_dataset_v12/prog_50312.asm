; DESCRIPTION: Renders a black line between points (484, 146) and (182, 32).
; PLAN: r0=484(x1), r1=146(y1), r2=182(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 146
LDI r2, 182
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
