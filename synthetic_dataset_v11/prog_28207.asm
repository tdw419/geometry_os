; DESCRIPTION: Places a blue line segment connecting (116, 252) to (191, 103).
; PLAN: r0=116(x1), r1=252(y1), r2=191(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 252
LDI r2, 191
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
