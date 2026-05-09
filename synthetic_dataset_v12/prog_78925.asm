; DESCRIPTION: Places a red line segment connecting (224, 225) to (161, 159).
; PLAN: r0=224(x1), r1=225(y1), r2=161(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 225
LDI r2, 161
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
