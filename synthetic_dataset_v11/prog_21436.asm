; DESCRIPTION: Places a green line segment connecting (168, 80) to (32, 101).
; PLAN: r0=168(x1), r1=80(y1), r2=32(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 80
LDI r2, 32
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
