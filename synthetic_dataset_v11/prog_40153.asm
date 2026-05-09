; DESCRIPTION: Renders a cyan line between points (253, 199) and (155, 229).
; PLAN: r0=253(x1), r1=199(y1), r2=155(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 199
LDI r2, 155
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
