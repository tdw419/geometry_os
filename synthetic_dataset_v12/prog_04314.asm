; DESCRIPTION: Renders a green line between points (184, 13) and (48, 94).
; PLAN: r0=184(x1), r1=13(y1), r2=48(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 13
LDI r2, 48
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
