; DESCRIPTION: Renders a green line between points (10, 241) and (62, 54).
; PLAN: r0=10(x1), r1=241(y1), r2=62(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 241
LDI r2, 62
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
