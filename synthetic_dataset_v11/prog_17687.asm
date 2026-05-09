; DESCRIPTION: Renders a black line between points (16, 231) and (250, 78).
; PLAN: r0=16(x1), r1=231(y1), r2=250(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 231
LDI r2, 250
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
