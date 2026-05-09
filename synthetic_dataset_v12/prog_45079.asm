; DESCRIPTION: Renders a green line between points (495, 254) and (451, 104).
; PLAN: r0=495(x1), r1=254(y1), r2=451(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 254
LDI r2, 451
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
