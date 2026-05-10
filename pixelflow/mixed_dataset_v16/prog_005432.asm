; DESCRIPTION: Places a white line segment connecting (224, 60) to (353, 212).
; PLAN: r0=224(x1), r1=60(y1), r2=353(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 60
LDI r2, 353
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
