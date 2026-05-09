; DESCRIPTION: Places a green line segment connecting (434, 133) to (58, 80).
; PLAN: r0=434(x1), r1=133(y1), r2=58(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 133
LDI r2, 58
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
