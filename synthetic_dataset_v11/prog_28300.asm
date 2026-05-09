; DESCRIPTION: Renders a black line between points (0, 95) and (250, 91).
; PLAN: r0=0(x1), r1=95(y1), r2=250(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 95
LDI r2, 250
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
