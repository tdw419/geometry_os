; DESCRIPTION: Places a green line segment connecting (30, 80) to (447, 220).
; PLAN: r0=30(x1), r1=80(y1), r2=447(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 80
LDI r2, 447
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
