; DESCRIPTION: Places a black line segment connecting (390, 226) to (28, 255).
; PLAN: r0=390(x1), r1=226(y1), r2=28(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 226
LDI r2, 28
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
