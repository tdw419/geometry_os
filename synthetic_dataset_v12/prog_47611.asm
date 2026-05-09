; DESCRIPTION: Renders a black line between points (145, 144) and (62, 125).
; PLAN: r0=145(x1), r1=144(y1), r2=62(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 144
LDI r2, 62
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
