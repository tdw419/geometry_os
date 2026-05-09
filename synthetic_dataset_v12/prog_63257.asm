; DESCRIPTION: Renders a green line between points (287, 158) and (345, 83).
; PLAN: r0=287(x1), r1=158(y1), r2=345(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 158
LDI r2, 345
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
