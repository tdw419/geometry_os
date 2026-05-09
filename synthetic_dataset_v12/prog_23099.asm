; DESCRIPTION: Draws a green line from (224, 139) to (348, 159).
; PLAN: r0=224(x1), r1=139(y1), r2=348(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 139
LDI r2, 348
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
