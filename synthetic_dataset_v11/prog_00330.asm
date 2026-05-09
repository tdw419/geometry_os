; DESCRIPTION: Renders a black line between points (8, 2) and (193, 188).
; PLAN: r0=8(x1), r1=2(y1), r2=193(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 2
LDI r2, 193
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
