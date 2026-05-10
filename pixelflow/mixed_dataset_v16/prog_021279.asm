; DESCRIPTION: Renders a yellow line between points (16, 0) and (65, 66).
; PLAN: r0=16(x1), r1=0(y1), r2=65(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 0
LDI r2, 65
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
