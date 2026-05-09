; DESCRIPTION: Places a white line segment connecting (67, 151) to (35, 16).
; PLAN: r0=67(x1), r1=151(y1), r2=35(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 151
LDI r2, 35
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
