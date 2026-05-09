; DESCRIPTION: Places a green line segment connecting (67, 0) to (239, 168).
; PLAN: r0=67(x1), r1=0(y1), r2=239(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 0
LDI r2, 239
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
