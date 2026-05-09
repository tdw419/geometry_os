; DESCRIPTION: Renders a green line between points (23, 246) and (268, 211).
; PLAN: r0=23(x1), r1=246(y1), r2=268(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 246
LDI r2, 268
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
