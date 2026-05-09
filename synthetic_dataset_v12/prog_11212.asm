; DESCRIPTION: Renders a green line between points (19, 98) and (248, 163).
; PLAN: r0=19(x1), r1=98(y1), r2=248(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 98
LDI r2, 248
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
