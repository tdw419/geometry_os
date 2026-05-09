; DESCRIPTION: Places a yellow line segment connecting (81, 163) to (164, 120).
; PLAN: r0=81(x1), r1=163(y1), r2=164(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 163
LDI r2, 164
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
