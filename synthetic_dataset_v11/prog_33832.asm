; DESCRIPTION: Renders a black line between points (165, 153) and (244, 222).
; PLAN: r0=165(x1), r1=153(y1), r2=244(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 153
LDI r2, 244
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
