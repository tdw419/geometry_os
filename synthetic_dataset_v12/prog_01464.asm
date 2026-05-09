; DESCRIPTION: Draws a white line from (232, 174) to (136, 111).
; PLAN: r0=232(x1), r1=174(y1), r2=136(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 174
LDI r2, 136
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
