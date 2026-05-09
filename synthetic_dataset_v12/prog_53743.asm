; DESCRIPTION: Draws a red line from (224, 157) to (510, 85).
; PLAN: r0=224(x1), r1=157(y1), r2=510(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 157
LDI r2, 510
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
