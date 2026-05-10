; DESCRIPTION: Draws a yellow line from (281, 105) to (80, 111).
; PLAN: r0=281(x1), r1=105(y1), r2=80(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 105
LDI r2, 80
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
