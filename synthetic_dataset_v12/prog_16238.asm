; DESCRIPTION: Renders a yellow line between points (244, 32) and (357, 55).
; PLAN: r0=244(x1), r1=32(y1), r2=357(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 32
LDI r2, 357
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
