; DESCRIPTION: Places a green line segment connecting (56, 142) to (233, 207).
; PLAN: r0=56(x1), r1=142(y1), r2=233(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 142
LDI r2, 233
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
