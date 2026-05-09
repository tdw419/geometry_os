; DESCRIPTION: Places a green line segment connecting (241, 94) to (32, 217).
; PLAN: r0=241(x1), r1=94(y1), r2=32(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 94
LDI r2, 32
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
