; DESCRIPTION: Places a green line segment connecting (38, 128) to (259, 254).
; PLAN: r0=38(x1), r1=128(y1), r2=259(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 128
LDI r2, 259
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
