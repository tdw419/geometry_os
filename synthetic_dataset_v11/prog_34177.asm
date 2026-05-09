; DESCRIPTION: Renders a white line between points (158, 139) and (165, 144).
; PLAN: r0=158(x1), r1=139(y1), r2=165(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 139
LDI r2, 165
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
