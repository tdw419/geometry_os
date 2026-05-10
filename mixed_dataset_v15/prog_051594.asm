; DESCRIPTION: Renders a black line between points (240, 110) and (150, 48).
; PLAN: r0=240(x1), r1=110(y1), r2=150(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 110
LDI r2, 150
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
