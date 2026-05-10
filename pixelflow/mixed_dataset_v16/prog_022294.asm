; DESCRIPTION: Places a green line segment connecting (239, 237) to (447, 201).
; PLAN: r0=239(x1), r1=237(y1), r2=447(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 237
LDI r2, 447
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
