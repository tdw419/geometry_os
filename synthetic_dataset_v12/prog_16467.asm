; DESCRIPTION: Places a red line segment connecting (299, 171) to (224, 136).
; PLAN: r0=299(x1), r1=171(y1), r2=224(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 171
LDI r2, 224
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
