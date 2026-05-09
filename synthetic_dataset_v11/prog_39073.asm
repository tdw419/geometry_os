; DESCRIPTION: Renders a green line between points (94, 96) and (162, 232).
; PLAN: r0=94(x1), r1=96(y1), r2=162(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 96
LDI r2, 162
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
