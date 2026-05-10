; DESCRIPTION: Places a white line segment connecting (418, 253) to (387, 206).
; PLAN: r0=418(x1), r1=253(y1), r2=387(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 253
LDI r2, 387
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
