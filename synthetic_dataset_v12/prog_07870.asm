; DESCRIPTION: Renders a cyan line between points (274, 24) and (37, 106).
; PLAN: r0=274(x1), r1=24(y1), r2=37(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 24
LDI r2, 37
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
