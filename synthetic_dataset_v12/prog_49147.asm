; DESCRIPTION: Renders a black line between points (210, 162) and (463, 190).
; PLAN: r0=210(x1), r1=162(y1), r2=463(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 162
LDI r2, 463
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
