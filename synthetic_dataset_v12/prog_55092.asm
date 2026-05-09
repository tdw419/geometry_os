; DESCRIPTION: Places a green line segment connecting (300, 14) to (509, 163).
; PLAN: r0=300(x1), r1=14(y1), r2=509(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 14
LDI r2, 509
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
