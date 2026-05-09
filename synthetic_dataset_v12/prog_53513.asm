; DESCRIPTION: Draws a yellow line from (134, 107) to (400, 111).
; PLAN: r0=134(x1), r1=107(y1), r2=400(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 107
LDI r2, 400
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
