; DESCRIPTION: Renders a black line between points (3, 161) and (96, 190).
; PLAN: r0=3(x1), r1=161(y1), r2=96(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 161
LDI r2, 96
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
