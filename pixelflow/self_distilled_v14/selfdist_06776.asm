; DESCRIPTION: Draws a green line from (122, 200) to (209, 111).
; PLAN: r0=122(x1), r1=200(y1), r2=209(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 200
LDI r2, 209
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
