; DESCRIPTION: Draws a blue line from (139, 192) to (320, 102).
; PLAN: r0=139(x1), r1=192(y1), r2=320(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 192
LDI r2, 320
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
