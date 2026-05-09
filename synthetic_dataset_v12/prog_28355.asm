; DESCRIPTION: Places a blue line segment connecting (231, 82) to (376, 135).
; PLAN: r0=231(x1), r1=82(y1), r2=376(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 82
LDI r2, 376
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
