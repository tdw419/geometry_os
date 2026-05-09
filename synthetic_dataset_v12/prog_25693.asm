; DESCRIPTION: Renders a orange line between points (360, 190) and (348, 111).
; PLAN: r0=360(x1), r1=190(y1), r2=348(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 190
LDI r2, 348
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
