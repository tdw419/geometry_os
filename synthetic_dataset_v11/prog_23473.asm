; DESCRIPTION: Places a purple line segment connecting (168, 91) to (246, 108).
; PLAN: r0=168(x1), r1=91(y1), r2=246(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 91
LDI r2, 246
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
