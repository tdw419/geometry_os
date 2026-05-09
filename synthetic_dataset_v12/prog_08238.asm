; DESCRIPTION: Renders a yellow line between points (462, 16) and (465, 130).
; PLAN: r0=462(x1), r1=16(y1), r2=465(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 16
LDI r2, 465
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
