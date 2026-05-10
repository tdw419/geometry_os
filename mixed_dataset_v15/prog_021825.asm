; DESCRIPTION: Places a black line segment connecting (160, 106) to (379, 210).
; PLAN: r0=160(x1), r1=106(y1), r2=379(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 106
LDI r2, 379
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
