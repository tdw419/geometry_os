; DESCRIPTION: Renders a green line between points (444, 139) and (268, 141).
; PLAN: r0=444(x1), r1=139(y1), r2=268(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 139
LDI r2, 268
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
