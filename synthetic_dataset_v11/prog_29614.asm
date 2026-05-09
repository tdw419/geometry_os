; DESCRIPTION: Renders a white line between points (68, 14) and (87, 233).
; PLAN: r0=68(x1), r1=14(y1), r2=87(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 14
LDI r2, 87
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
