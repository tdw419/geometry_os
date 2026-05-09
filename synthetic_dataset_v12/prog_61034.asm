; DESCRIPTION: Places a green line segment connecting (300, 179) to (129, 32).
; PLAN: r0=300(x1), r1=179(y1), r2=129(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 179
LDI r2, 129
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
