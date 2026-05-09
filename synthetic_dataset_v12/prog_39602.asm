; DESCRIPTION: Renders a black line between points (32, 70) and (181, 2).
; PLAN: r0=32(x1), r1=70(y1), r2=181(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 70
LDI r2, 181
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
