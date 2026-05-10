; DESCRIPTION: Places a white line segment connecting (418, 128) to (285, 246).
; PLAN: r0=418(x1), r1=128(y1), r2=285(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 128
LDI r2, 285
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
