; DESCRIPTION: Renders a green line between points (118, 140) and (23, 179).
; PLAN: r0=118(x1), r1=140(y1), r2=23(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 140
LDI r2, 23
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
