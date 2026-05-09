; DESCRIPTION: Renders a cyan line between points (7, 232) and (287, 159).
; PLAN: r0=7(x1), r1=232(y1), r2=287(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 232
LDI r2, 287
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
