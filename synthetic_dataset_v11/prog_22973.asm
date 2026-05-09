; DESCRIPTION: Places a green line segment connecting (120, 8) to (193, 101).
; PLAN: r0=120(x1), r1=8(y1), r2=193(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 8
LDI r2, 193
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
