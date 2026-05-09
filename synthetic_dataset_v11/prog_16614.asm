; DESCRIPTION: Draws a green line from (7, 62) to (104, 111).
; PLAN: r0=7(x1), r1=62(y1), r2=104(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 62
LDI r2, 104
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
