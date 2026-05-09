; DESCRIPTION: Places a green line segment connecting (29, 218) to (60, 103).
; PLAN: r0=29(x1), r1=218(y1), r2=60(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 218
LDI r2, 60
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
