; DESCRIPTION: Renders a black line between points (128, 70) and (63, 100).
; PLAN: r0=128(x1), r1=70(y1), r2=63(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 70
LDI r2, 63
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
