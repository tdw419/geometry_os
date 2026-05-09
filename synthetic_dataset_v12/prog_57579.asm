; DESCRIPTION: Renders a black line between points (49, 133) and (208, 240).
; PLAN: r0=49(x1), r1=133(y1), r2=208(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 133
LDI r2, 208
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
