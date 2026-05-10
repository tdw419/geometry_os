; DESCRIPTION: Places a red line segment connecting (407, 66) to (113, 156).
; PLAN: r0=407(x1), r1=66(y1), r2=113(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 66
LDI r2, 113
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
