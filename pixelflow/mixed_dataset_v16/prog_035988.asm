; DESCRIPTION: Places a green line segment connecting (137, 58) to (326, 68).
; PLAN: r0=137(x1), r1=58(y1), r2=326(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 58
LDI r2, 326
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
