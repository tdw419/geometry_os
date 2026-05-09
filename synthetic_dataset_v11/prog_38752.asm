; DESCRIPTION: Renders a black line between points (100, 150) and (70, 74).
; PLAN: r0=100(x1), r1=150(y1), r2=70(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 150
LDI r2, 70
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
