; DESCRIPTION: Renders a black line between points (73, 146) and (18, 129).
; PLAN: r0=73(x1), r1=146(y1), r2=18(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 146
LDI r2, 18
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
