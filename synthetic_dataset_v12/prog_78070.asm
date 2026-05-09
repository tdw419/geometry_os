; DESCRIPTION: Renders a black line between points (173, 93) and (89, 72).
; PLAN: r0=173(x1), r1=93(y1), r2=89(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 93
LDI r2, 89
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
