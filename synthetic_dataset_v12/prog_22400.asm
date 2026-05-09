; DESCRIPTION: Places a red line segment connecting (262, 226) to (156, 203).
; PLAN: r0=262(x1), r1=226(y1), r2=156(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 226
LDI r2, 156
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
