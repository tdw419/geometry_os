; DESCRIPTION: Places a green line segment connecting (252, 71) to (183, 67).
; PLAN: r0=252(x1), r1=71(y1), r2=183(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 71
LDI r2, 183
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
