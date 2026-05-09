; DESCRIPTION: Places a red line segment connecting (224, 199) to (70, 107).
; PLAN: r0=224(x1), r1=199(y1), r2=70(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 199
LDI r2, 70
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
