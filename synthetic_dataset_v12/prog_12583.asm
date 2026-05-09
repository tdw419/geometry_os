; DESCRIPTION: Renders a black line between points (11, 118) and (207, 53).
; PLAN: r0=11(x1), r1=118(y1), r2=207(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 118
LDI r2, 207
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
