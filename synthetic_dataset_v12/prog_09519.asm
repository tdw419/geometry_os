; DESCRIPTION: Renders a white line between points (268, 175) and (179, 54).
; PLAN: r0=268(x1), r1=175(y1), r2=179(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 175
LDI r2, 179
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
