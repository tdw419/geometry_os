; DESCRIPTION: Renders a black line between points (198, 73) and (102, 129).
; PLAN: r0=198(x1), r1=73(y1), r2=102(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 73
LDI r2, 102
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
