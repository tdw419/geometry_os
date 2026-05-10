; DESCRIPTION: Draws a red line from (205, 178) to (261, 111).
; PLAN: r0=205(x1), r1=178(y1), r2=261(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 178
LDI r2, 261
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
