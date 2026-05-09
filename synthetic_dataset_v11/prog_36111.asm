; DESCRIPTION: Places a red line segment connecting (247, 203) to (169, 172).
; PLAN: r0=247(x1), r1=203(y1), r2=169(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 203
LDI r2, 169
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
