; DESCRIPTION: Places a red line segment connecting (445, 100) to (224, 231).
; PLAN: r0=445(x1), r1=100(y1), r2=224(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 100
LDI r2, 224
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
