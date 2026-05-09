; DESCRIPTION: Renders a black line between points (240, 76) and (2, 25).
; PLAN: r0=240(x1), r1=76(y1), r2=2(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 76
LDI r2, 2
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
