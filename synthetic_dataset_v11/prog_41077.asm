; DESCRIPTION: Draws a orange line from (57, 155) to (208, 111).
; PLAN: r0=57(x1), r1=155(y1), r2=208(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 155
LDI r2, 208
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
