; DESCRIPTION: Renders a green line between points (119, 184) and (119, 32).
; PLAN: r0=119(x1), r1=184(y1), r2=119(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 184
LDI r2, 119
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
