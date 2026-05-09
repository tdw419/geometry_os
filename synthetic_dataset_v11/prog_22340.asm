; DESCRIPTION: Renders a white line between points (71, 2) and (179, 23).
; PLAN: r0=71(x1), r1=2(y1), r2=179(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 2
LDI r2, 179
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
