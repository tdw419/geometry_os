; DESCRIPTION: Places a blue line segment connecting (156, 197) to (81, 226).
; PLAN: r0=156(x1), r1=197(y1), r2=81(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 197
LDI r2, 81
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
