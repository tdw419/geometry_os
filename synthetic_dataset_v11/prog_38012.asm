; DESCRIPTION: Places a green line segment connecting (137, 93) to (114, 32).
; PLAN: r0=137(x1), r1=93(y1), r2=114(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 93
LDI r2, 114
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
