; DESCRIPTION: Places a black line segment connecting (200, 255) to (326, 143).
; PLAN: r0=200(x1), r1=255(y1), r2=326(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 255
LDI r2, 326
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
