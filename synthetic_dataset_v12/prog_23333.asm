; DESCRIPTION: Renders a cyan line between points (287, 11) and (155, 204).
; PLAN: r0=287(x1), r1=11(y1), r2=155(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 11
LDI r2, 155
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
