; DESCRIPTION: Places a green line segment connecting (408, 93) to (200, 118).
; PLAN: r0=408(x1), r1=93(y1), r2=200(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 93
LDI r2, 200
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
