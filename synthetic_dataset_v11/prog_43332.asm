; DESCRIPTION: Places a white line segment connecting (158, 85) to (195, 126).
; PLAN: r0=158(x1), r1=85(y1), r2=195(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 85
LDI r2, 195
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
