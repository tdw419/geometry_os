; DESCRIPTION: Draws a black line from (16, 188) to (192, 68).
; PLAN: r0=16(x1), r1=188(y1), r2=192(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 188
LDI r2, 192
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
