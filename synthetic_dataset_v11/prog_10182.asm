; DESCRIPTION: Renders a green line between points (118, 32) and (222, 11).
; PLAN: r0=118(x1), r1=32(y1), r2=222(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 32
LDI r2, 222
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
