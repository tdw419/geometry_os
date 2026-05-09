; DESCRIPTION: Draws a red line from (323, 195) to (224, 73).
; PLAN: r0=323(x1), r1=195(y1), r2=224(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 195
LDI r2, 224
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
