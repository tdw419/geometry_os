; DESCRIPTION: Places a blue line segment connecting (61, 82) to (359, 127).
; PLAN: r0=61(x1), r1=82(y1), r2=359(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 82
LDI r2, 359
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
