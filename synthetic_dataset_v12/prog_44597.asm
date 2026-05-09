; DESCRIPTION: Renders a yellow line between points (133, 138) and (456, 76).
; PLAN: r0=133(x1), r1=138(y1), r2=456(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 138
LDI r2, 456
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
