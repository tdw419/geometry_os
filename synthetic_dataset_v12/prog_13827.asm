; DESCRIPTION: Places a white line segment connecting (418, 60) to (310, 206).
; PLAN: r0=418(x1), r1=60(y1), r2=310(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 60
LDI r2, 310
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
