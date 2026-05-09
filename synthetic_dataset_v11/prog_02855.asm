; DESCRIPTION: Draws a white line from (88, 43) to (127, 111).
; PLAN: r0=88(x1), r1=43(y1), r2=127(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 43
LDI r2, 127
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
