; DESCRIPTION: Places a green line segment connecting (3, 218) to (218, 64).
; PLAN: r0=3(x1), r1=218(y1), r2=218(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 218
LDI r2, 218
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
