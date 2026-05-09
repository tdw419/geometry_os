; DESCRIPTION: Places a red line segment connecting (108, 57) to (96, 88).
; PLAN: r0=108(x1), r1=57(y1), r2=96(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 57
LDI r2, 96
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
