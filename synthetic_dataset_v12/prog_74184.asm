; DESCRIPTION: Places a white line segment connecting (158, 32) to (319, 211).
; PLAN: r0=158(x1), r1=32(y1), r2=319(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 32
LDI r2, 319
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
