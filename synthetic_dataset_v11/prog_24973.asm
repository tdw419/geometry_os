; DESCRIPTION: Places a red line segment connecting (59, 102) to (29, 40).
; PLAN: r0=59(x1), r1=102(y1), r2=29(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 102
LDI r2, 29
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
