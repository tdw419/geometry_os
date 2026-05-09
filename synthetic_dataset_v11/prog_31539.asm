; DESCRIPTION: Draws a blue line from (177, 38) to (77, 111).
; PLAN: r0=177(x1), r1=38(y1), r2=77(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 38
LDI r2, 77
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
