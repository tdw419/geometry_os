; DESCRIPTION: Places a red line segment connecting (255, 176) to (156, 189).
; PLAN: r0=255(x1), r1=176(y1), r2=156(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 176
LDI r2, 156
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
