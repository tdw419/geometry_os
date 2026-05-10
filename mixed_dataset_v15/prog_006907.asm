; DESCRIPTION: Draws a red line from (292, 224) to (300, 76).
; PLAN: r0=292(x1), r1=224(y1), r2=300(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 224
LDI r2, 300
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
