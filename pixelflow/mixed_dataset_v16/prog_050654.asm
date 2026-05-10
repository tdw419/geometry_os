; DESCRIPTION: Places a red line segment connecting (108, 203) to (154, 40).
; PLAN: r0=108(x1), r1=203(y1), r2=154(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 203
LDI r2, 154
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
