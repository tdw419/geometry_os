; DESCRIPTION: Draws a magenta line from (192, 26) to (406, 43).
; PLAN: r0=192(x1), r1=26(y1), r2=406(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 26
LDI r2, 406
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
