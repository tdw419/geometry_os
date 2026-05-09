; DESCRIPTION: Renders a orange line between points (92, 207) and (128, 111).
; PLAN: r0=92(x1), r1=207(y1), r2=128(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 207
LDI r2, 128
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
