; DESCRIPTION: Places a black line segment connecting (138, 94) to (64, 255).
; PLAN: r0=138(x1), r1=94(y1), r2=64(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 94
LDI r2, 64
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
