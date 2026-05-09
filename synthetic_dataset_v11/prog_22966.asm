; DESCRIPTION: Places a green line segment connecting (148, 150) to (61, 131).
; PLAN: r0=148(x1), r1=150(y1), r2=61(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 150
LDI r2, 61
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
