; DESCRIPTION: Places a white line segment connecting (474, 67) to (96, 156).
; PLAN: r0=474(x1), r1=67(y1), r2=96(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 67
LDI r2, 96
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
