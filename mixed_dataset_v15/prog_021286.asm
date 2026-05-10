; DESCRIPTION: Places a green line segment connecting (67, 179) to (120, 183).
; PLAN: r0=67(x1), r1=179(y1), r2=120(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 179
LDI r2, 120
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
