; DESCRIPTION: Renders a green line between points (462, 7) and (66, 232).
; PLAN: r0=462(x1), r1=7(y1), r2=66(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 7
LDI r2, 66
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
