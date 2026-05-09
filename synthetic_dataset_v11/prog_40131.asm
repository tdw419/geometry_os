; DESCRIPTION: Renders a green line between points (100, 74) and (62, 52).
; PLAN: r0=100(x1), r1=74(y1), r2=62(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 74
LDI r2, 62
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
