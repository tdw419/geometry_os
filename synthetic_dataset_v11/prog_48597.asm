; DESCRIPTION: Renders a cyan line between points (179, 136) and (129, 217).
; PLAN: r0=179(x1), r1=136(y1), r2=129(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 136
LDI r2, 129
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
