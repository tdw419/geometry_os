; DESCRIPTION: Places a red line segment connecting (130, 224) to (161, 82).
; PLAN: r0=130(x1), r1=224(y1), r2=161(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 224
LDI r2, 161
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
