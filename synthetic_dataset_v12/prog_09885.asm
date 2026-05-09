; DESCRIPTION: Places a white line segment connecting (387, 112) to (56, 206).
; PLAN: r0=387(x1), r1=112(y1), r2=56(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 112
LDI r2, 56
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
