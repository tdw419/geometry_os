; DESCRIPTION: Places a green line segment connecting (67, 112) to (40, 43).
; PLAN: r0=67(x1), r1=112(y1), r2=40(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 112
LDI r2, 40
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
