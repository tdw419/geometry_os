; DESCRIPTION: Renders a yellow line between points (164, 75) and (65, 65).
; PLAN: r0=164(x1), r1=75(y1), r2=65(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 75
LDI r2, 65
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
