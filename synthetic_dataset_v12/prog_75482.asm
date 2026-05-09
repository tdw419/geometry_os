; DESCRIPTION: Places a blue line segment connecting (30, 120) to (98, 148).
; PLAN: r0=30(x1), r1=120(y1), r2=98(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 120
LDI r2, 98
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
