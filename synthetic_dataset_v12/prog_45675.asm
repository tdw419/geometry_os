; DESCRIPTION: Renders a black line between points (91, 0) and (153, 72).
; PLAN: r0=91(x1), r1=0(y1), r2=153(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 0
LDI r2, 153
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
