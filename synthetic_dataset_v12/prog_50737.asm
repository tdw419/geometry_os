; DESCRIPTION: Places a green line segment connecting (409, 214) to (466, 67).
; PLAN: r0=409(x1), r1=214(y1), r2=466(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 214
LDI r2, 466
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
