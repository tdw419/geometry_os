; DESCRIPTION: Places a white line segment connecting (363, 230) to (64, 149).
; PLAN: r0=363(x1), r1=230(y1), r2=64(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 230
LDI r2, 64
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
