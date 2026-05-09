; DESCRIPTION: Places a green line segment connecting (58, 236) to (307, 129).
; PLAN: r0=58(x1), r1=236(y1), r2=307(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 236
LDI r2, 307
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
