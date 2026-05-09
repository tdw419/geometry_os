; DESCRIPTION: Places a red line segment connecting (69, 78) to (224, 199).
; PLAN: r0=69(x1), r1=78(y1), r2=224(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 78
LDI r2, 224
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
