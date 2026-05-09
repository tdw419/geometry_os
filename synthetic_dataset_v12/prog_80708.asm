; DESCRIPTION: Renders a white line between points (261, 66) and (379, 93).
; PLAN: r0=261(x1), r1=66(y1), r2=379(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 379
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
