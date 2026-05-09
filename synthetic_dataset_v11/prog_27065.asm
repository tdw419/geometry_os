; DESCRIPTION: Renders a black line between points (104, 122) and (52, 29).
; PLAN: r0=104(x1), r1=122(y1), r2=52(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 122
LDI r2, 52
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
