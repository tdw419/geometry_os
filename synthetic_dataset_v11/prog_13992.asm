; DESCRIPTION: Renders a green line between points (139, 16) and (81, 26).
; PLAN: r0=139(x1), r1=16(y1), r2=81(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 16
LDI r2, 81
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
