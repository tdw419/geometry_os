; DESCRIPTION: Renders a black line between points (70, 197) and (88, 72).
; PLAN: r0=70(x1), r1=197(y1), r2=88(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 197
LDI r2, 88
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
