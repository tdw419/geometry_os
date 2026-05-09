; DESCRIPTION: Renders a white line between points (259, 192) and (31, 200).
; PLAN: r0=259(x1), r1=192(y1), r2=31(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 192
LDI r2, 31
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
