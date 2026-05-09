; DESCRIPTION: Renders a white line between points (156, 179) and (331, 38).
; PLAN: r0=156(x1), r1=179(y1), r2=331(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 179
LDI r2, 331
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
