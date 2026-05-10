; DESCRIPTION: Renders a white line between points (361, 192) and (246, 149).
; PLAN: r0=361(x1), r1=192(y1), r2=246(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 192
LDI r2, 246
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
