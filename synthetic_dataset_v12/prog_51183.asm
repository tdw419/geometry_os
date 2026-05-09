; DESCRIPTION: Renders a black line between points (421, 150) and (185, 75).
; PLAN: r0=421(x1), r1=150(y1), r2=185(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 150
LDI r2, 185
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
