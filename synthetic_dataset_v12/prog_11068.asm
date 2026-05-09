; DESCRIPTION: Places a black line segment connecting (128, 60) to (355, 59).
; PLAN: r0=128(x1), r1=60(y1), r2=355(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 60
LDI r2, 355
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
