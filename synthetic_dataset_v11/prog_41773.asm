; DESCRIPTION: Places a yellow line segment connecting (215, 170) to (109, 68).
; PLAN: r0=215(x1), r1=170(y1), r2=109(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 170
LDI r2, 109
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
