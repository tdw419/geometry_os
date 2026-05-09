; DESCRIPTION: Places a yellow line segment connecting (21, 255) to (326, 14).
; PLAN: r0=21(x1), r1=255(y1), r2=326(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 255
LDI r2, 326
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
