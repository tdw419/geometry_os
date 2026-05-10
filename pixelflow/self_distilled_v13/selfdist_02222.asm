; DESCRIPTION: Draws a orange line from (153, 125) to (75, 111).
; PLAN: r0=153(x1), r1=125(y1), r2=75(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 125
LDI r2, 75
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
