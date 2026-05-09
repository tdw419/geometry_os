; DESCRIPTION: Places a green line segment connecting (297, 15) to (175, 64).
; PLAN: r0=297(x1), r1=15(y1), r2=175(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 15
LDI r2, 175
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
