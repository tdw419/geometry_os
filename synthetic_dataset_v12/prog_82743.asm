; DESCRIPTION: Renders a yellow line between points (18, 65) and (154, 110).
; PLAN: r0=18(x1), r1=65(y1), r2=154(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 65
LDI r2, 154
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
