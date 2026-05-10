; DESCRIPTION: Places a green line segment connecting (32, 179) to (232, 220).
; PLAN: r0=32(x1), r1=179(y1), r2=232(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 179
LDI r2, 232
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
