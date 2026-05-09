; DESCRIPTION: Places a red line segment connecting (58, 37) to (165, 156).
; PLAN: r0=58(x1), r1=37(y1), r2=165(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 37
LDI r2, 165
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
