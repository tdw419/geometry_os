; DESCRIPTION: Renders a yellow line between points (22, 65) and (164, 60).
; PLAN: r0=22(x1), r1=65(y1), r2=164(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 65
LDI r2, 164
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
