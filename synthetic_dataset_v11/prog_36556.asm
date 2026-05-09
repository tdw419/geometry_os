; DESCRIPTION: Places a blue line segment connecting (4, 186) to (156, 60).
; PLAN: r0=4(x1), r1=186(y1), r2=156(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 186
LDI r2, 156
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
