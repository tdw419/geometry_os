; DESCRIPTION: Places a green line segment connecting (67, 135) to (165, 98).
; PLAN: r0=67(x1), r1=135(y1), r2=165(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 135
LDI r2, 165
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
