; DESCRIPTION: Places a green line segment connecting (116, 108) to (118, 25).
; PLAN: r0=116(x1), r1=108(y1), r2=118(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 108
LDI r2, 118
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
