; DESCRIPTION: Renders a black line between points (128, 122) and (87, 119).
; PLAN: r0=128(x1), r1=122(y1), r2=87(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 122
LDI r2, 87
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
