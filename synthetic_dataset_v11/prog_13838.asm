; DESCRIPTION: Places a green line segment connecting (10, 133) to (67, 90).
; PLAN: r0=10(x1), r1=133(y1), r2=67(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 133
LDI r2, 67
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
