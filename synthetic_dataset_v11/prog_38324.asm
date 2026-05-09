; DESCRIPTION: Places a orange line segment connecting (134, 146) to (60, 111).
; PLAN: r0=134(x1), r1=146(y1), r2=60(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 146
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
