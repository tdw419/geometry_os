; DESCRIPTION: Renders a green line between points (72, 165) and (205, 137).
; PLAN: r0=72(x1), r1=165(y1), r2=205(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 165
LDI r2, 205
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
