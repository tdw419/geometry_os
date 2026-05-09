; DESCRIPTION: Places a black line segment connecting (413, 125) to (244, 221).
; PLAN: r0=413(x1), r1=125(y1), r2=244(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 125
LDI r2, 244
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
