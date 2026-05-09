; DESCRIPTION: Renders a green line between points (328, 176) and (495, 245).
; PLAN: r0=328(x1), r1=176(y1), r2=495(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 176
LDI r2, 495
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
