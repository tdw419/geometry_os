; DESCRIPTION: Renders a white line between points (158, 22) and (309, 0).
; PLAN: r0=158(x1), r1=22(y1), r2=309(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 22
LDI r2, 309
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
