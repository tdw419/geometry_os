; DESCRIPTION: Renders a black line between points (185, 135) and (91, 144).
; PLAN: r0=185(x1), r1=135(y1), r2=91(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 135
LDI r2, 91
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
