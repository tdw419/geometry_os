; DESCRIPTION: Places a green line segment connecting (263, 53) to (4, 24).
; PLAN: r0=263(x1), r1=53(y1), r2=4(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 53
LDI r2, 4
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
