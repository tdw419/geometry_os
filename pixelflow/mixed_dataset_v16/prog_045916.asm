; DESCRIPTION: Renders a black line between points (244, 132) and (481, 165).
; PLAN: r0=244(x1), r1=132(y1), r2=481(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 132
LDI r2, 481
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
