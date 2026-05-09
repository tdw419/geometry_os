; DESCRIPTION: Renders a black line between points (247, 163) and (140, 4).
; PLAN: r0=247(x1), r1=163(y1), r2=140(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 163
LDI r2, 140
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
