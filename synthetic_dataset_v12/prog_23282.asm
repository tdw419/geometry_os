; DESCRIPTION: Draws a red line from (364, 248) to (192, 0).
; PLAN: r0=364(x1), r1=248(y1), r2=192(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 248
LDI r2, 192
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
