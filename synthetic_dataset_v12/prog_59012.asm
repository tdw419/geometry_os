; DESCRIPTION: Draws a blue line from (192, 78) to (113, 176).
; PLAN: r0=192(x1), r1=78(y1), r2=113(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 78
LDI r2, 113
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
