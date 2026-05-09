; DESCRIPTION: Renders a black line between points (170, 221) and (1, 18).
; PLAN: r0=170(x1), r1=221(y1), r2=1(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 221
LDI r2, 1
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
