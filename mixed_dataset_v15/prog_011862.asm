; DESCRIPTION: Renders a green line between points (409, 176) and (477, 54).
; PLAN: r0=409(x1), r1=176(y1), r2=477(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 176
LDI r2, 477
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
