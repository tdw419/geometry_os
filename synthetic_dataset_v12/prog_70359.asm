; DESCRIPTION: Places a red line segment connecting (270, 156) to (411, 210).
; PLAN: r0=270(x1), r1=156(y1), r2=411(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 156
LDI r2, 411
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
