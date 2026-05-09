; DESCRIPTION: Renders a black line between points (143, 114) and (84, 5).
; PLAN: r0=143(x1), r1=114(y1), r2=84(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 114
LDI r2, 84
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
