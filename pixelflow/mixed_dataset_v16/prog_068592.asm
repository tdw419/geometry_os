; DESCRIPTION: Places a yellow line segment connecting (437, 136) to (307, 42).
; PLAN: r0=437(x1), r1=136(y1), r2=307(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 136
LDI r2, 307
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
