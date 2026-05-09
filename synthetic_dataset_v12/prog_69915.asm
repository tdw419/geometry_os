; DESCRIPTION: Renders a green line between points (451, 104) and (281, 150).
; PLAN: r0=451(x1), r1=104(y1), r2=281(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 104
LDI r2, 281
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
