; DESCRIPTION: Places a black line segment connecting (99, 128) to (474, 243).
; PLAN: r0=99(x1), r1=128(y1), r2=474(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 128
LDI r2, 474
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
