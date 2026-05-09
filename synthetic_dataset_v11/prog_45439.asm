; DESCRIPTION: Renders a green line between points (230, 158) and (120, 64).
; PLAN: r0=230(x1), r1=158(y1), r2=120(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 158
LDI r2, 120
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
