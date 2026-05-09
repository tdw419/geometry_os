; DESCRIPTION: Renders a green line between points (37, 50) and (139, 175).
; PLAN: r0=37(x1), r1=50(y1), r2=139(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 50
LDI r2, 139
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
