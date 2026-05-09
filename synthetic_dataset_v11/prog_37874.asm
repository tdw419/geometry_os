; DESCRIPTION: Places a blue line segment connecting (156, 187) to (150, 153).
; PLAN: r0=156(x1), r1=187(y1), r2=150(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 187
LDI r2, 150
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
