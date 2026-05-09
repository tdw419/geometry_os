; DESCRIPTION: Places a green line segment connecting (189, 179) to (160, 230).
; PLAN: r0=189(x1), r1=179(y1), r2=160(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 179
LDI r2, 160
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
