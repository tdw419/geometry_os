; DESCRIPTION: Renders a black line between points (238, 217) and (103, 52).
; PLAN: r0=238(x1), r1=217(y1), r2=103(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 217
LDI r2, 103
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
