; DESCRIPTION: Places a green line segment connecting (313, 67) to (227, 204).
; PLAN: r0=313(x1), r1=67(y1), r2=227(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 67
LDI r2, 227
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
