; DESCRIPTION: Renders a black line between points (473, 146) and (262, 66).
; PLAN: r0=473(x1), r1=146(y1), r2=262(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 146
LDI r2, 262
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
