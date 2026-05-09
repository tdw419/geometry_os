; DESCRIPTION: Places a red line segment connecting (58, 205) to (103, 67).
; PLAN: r0=58(x1), r1=205(y1), r2=103(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 205
LDI r2, 103
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
