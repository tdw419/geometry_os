; DESCRIPTION: Draws a yellow line from (330, 140) to (250, 111).
; PLAN: r0=330(x1), r1=140(y1), r2=250(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 140
LDI r2, 250
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
