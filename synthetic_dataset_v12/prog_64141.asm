; DESCRIPTION: Draws a purple line from (102, 62) to (320, 255).
; PLAN: r0=102(x1), r1=62(y1), r2=320(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 62
LDI r2, 320
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
