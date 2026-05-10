; DESCRIPTION: Renders a red line between points (224, 39) and (200, 157).
; PLAN: r0=224(x1), r1=39(y1), r2=200(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 39
LDI r2, 200
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
