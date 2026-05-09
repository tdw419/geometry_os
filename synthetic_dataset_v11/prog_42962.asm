; DESCRIPTION: Renders a black line between points (16, 11) and (120, 101).
; PLAN: r0=16(x1), r1=11(y1), r2=120(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 11
LDI r2, 120
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
