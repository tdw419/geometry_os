; DESCRIPTION: Draws a blue line from (0, 9) to (175, 111).
; PLAN: r0=0(x1), r1=9(y1), r2=175(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 9
LDI r2, 175
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
