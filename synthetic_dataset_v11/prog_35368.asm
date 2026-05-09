; DESCRIPTION: Places a red line segment connecting (156, 4) to (226, 189).
; PLAN: r0=156(x1), r1=4(y1), r2=226(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 4
LDI r2, 226
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
