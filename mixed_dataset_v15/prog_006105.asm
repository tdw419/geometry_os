; DESCRIPTION: Renders a green line between points (129, 93) and (37, 14).
; PLAN: r0=129(x1), r1=93(y1), r2=37(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 93
LDI r2, 37
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
