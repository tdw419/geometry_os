; DESCRIPTION: Renders a white line between points (468, 54) and (297, 192).
; PLAN: r0=468(x1), r1=54(y1), r2=297(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 54
LDI r2, 297
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
