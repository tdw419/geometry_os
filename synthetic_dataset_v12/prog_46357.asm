; DESCRIPTION: Renders a white line between points (457, 66) and (347, 68).
; PLAN: r0=457(x1), r1=66(y1), r2=347(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 66
LDI r2, 347
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
