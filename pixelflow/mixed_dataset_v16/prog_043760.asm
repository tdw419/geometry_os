; DESCRIPTION: Places a green line segment connecting (218, 128) to (269, 10).
; PLAN: r0=218(x1), r1=128(y1), r2=269(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 128
LDI r2, 269
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
