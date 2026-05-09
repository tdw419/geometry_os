; DESCRIPTION: Renders a black line between points (244, 99) and (434, 142).
; PLAN: r0=244(x1), r1=99(y1), r2=434(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 99
LDI r2, 434
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
