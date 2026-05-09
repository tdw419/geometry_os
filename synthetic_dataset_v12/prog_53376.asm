; DESCRIPTION: Renders a green line between points (100, 154) and (6, 251).
; PLAN: r0=100(x1), r1=154(y1), r2=6(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 154
LDI r2, 6
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
