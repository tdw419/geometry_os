; DESCRIPTION: Places a yellow line segment connecting (306, 133) to (156, 184).
; PLAN: r0=306(x1), r1=133(y1), r2=156(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 133
LDI r2, 156
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
