; DESCRIPTION: Draws a red line from (105, 140) to (210, 111).
; PLAN: r0=105(x1), r1=140(y1), r2=210(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 140
LDI r2, 210
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
