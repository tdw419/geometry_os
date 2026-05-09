; DESCRIPTION: Places a red line segment connecting (113, 203) to (155, 229).
; PLAN: r0=113(x1), r1=203(y1), r2=155(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 203
LDI r2, 155
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
