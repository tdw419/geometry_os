; DESCRIPTION: Places a red line segment connecting (168, 203) to (28, 178).
; PLAN: r0=168(x1), r1=203(y1), r2=28(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 203
LDI r2, 28
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
