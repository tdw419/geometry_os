; DESCRIPTION: Places a green line segment connecting (53, 42) to (388, 23).
; PLAN: r0=53(x1), r1=42(y1), r2=388(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 42
LDI r2, 388
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
