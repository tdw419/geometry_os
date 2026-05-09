; DESCRIPTION: Places a green line segment connecting (396, 42) to (121, 201).
; PLAN: r0=396(x1), r1=42(y1), r2=121(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 42
LDI r2, 121
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
