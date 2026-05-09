; DESCRIPTION: Places a yellow line segment connecting (433, 22) to (377, 134).
; PLAN: r0=433(x1), r1=22(y1), r2=377(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 22
LDI r2, 377
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
