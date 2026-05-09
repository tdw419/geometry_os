; DESCRIPTION: Renders a white line between points (87, 207) and (158, 75).
; PLAN: r0=87(x1), r1=207(y1), r2=158(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 207
LDI r2, 158
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
