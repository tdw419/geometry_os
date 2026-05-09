; DESCRIPTION: Renders a black line between points (68, 28) and (343, 77).
; PLAN: r0=68(x1), r1=28(y1), r2=343(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 28
LDI r2, 343
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
