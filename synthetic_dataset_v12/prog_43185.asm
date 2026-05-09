; DESCRIPTION: Places a white line segment connecting (282, 199) to (198, 11).
; PLAN: r0=282(x1), r1=199(y1), r2=198(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 199
LDI r2, 198
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
