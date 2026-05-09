; DESCRIPTION: Renders a green line between points (35, 94) and (53, 90).
; PLAN: r0=35(x1), r1=94(y1), r2=53(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 94
LDI r2, 53
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
