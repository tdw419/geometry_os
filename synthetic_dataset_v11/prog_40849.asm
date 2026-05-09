; DESCRIPTION: Places a green line segment connecting (179, 185) to (195, 191).
; PLAN: r0=179(x1), r1=185(y1), r2=195(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 185
LDI r2, 195
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
