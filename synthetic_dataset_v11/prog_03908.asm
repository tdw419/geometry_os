; DESCRIPTION: Places a red line segment connecting (233, 166) to (78, 16).
; PLAN: r0=233(x1), r1=166(y1), r2=78(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 166
LDI r2, 78
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
