; DESCRIPTION: Places a black line segment connecting (157, 80) to (422, 65).
; PLAN: r0=157(x1), r1=80(y1), r2=422(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 80
LDI r2, 422
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
