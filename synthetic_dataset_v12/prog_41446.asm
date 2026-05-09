; DESCRIPTION: Renders a black line between points (164, 163) and (39, 185).
; PLAN: r0=164(x1), r1=163(y1), r2=39(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 163
LDI r2, 39
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
