; DESCRIPTION: Renders a yellow line between points (244, 44) and (72, 10).
; PLAN: r0=244(x1), r1=44(y1), r2=72(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 44
LDI r2, 72
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
