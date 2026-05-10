; DESCRIPTION: Places a red line segment connecting (224, 88) to (151, 127).
; PLAN: r0=224(x1), r1=88(y1), r2=151(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 88
LDI r2, 151
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
