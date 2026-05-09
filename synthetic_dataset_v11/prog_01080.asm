; DESCRIPTION: Renders a white line between points (23, 165) and (77, 74).
; PLAN: r0=23(x1), r1=165(y1), r2=77(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 165
LDI r2, 77
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
