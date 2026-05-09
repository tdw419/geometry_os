; DESCRIPTION: Places a green line segment connecting (57, 10) to (142, 234).
; PLAN: r0=57(x1), r1=10(y1), r2=142(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 10
LDI r2, 142
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
