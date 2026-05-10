; DESCRIPTION: Renders a black line between points (455, 33) and (250, 250).
; PLAN: r0=455(x1), r1=33(y1), r2=250(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 33
LDI r2, 250
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
