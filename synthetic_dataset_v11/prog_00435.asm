; DESCRIPTION: Renders a black line between points (72, 221) and (114, 129).
; PLAN: r0=72(x1), r1=221(y1), r2=114(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 221
LDI r2, 114
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
