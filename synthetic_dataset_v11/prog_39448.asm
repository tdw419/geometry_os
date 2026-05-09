; DESCRIPTION: Renders a cyan line between points (93, 176) and (227, 49).
; PLAN: r0=93(x1), r1=176(y1), r2=227(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 176
LDI r2, 227
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
