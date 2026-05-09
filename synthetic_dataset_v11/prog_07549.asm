; DESCRIPTION: Places a green line segment connecting (228, 78) to (67, 84).
; PLAN: r0=228(x1), r1=78(y1), r2=67(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 78
LDI r2, 67
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
