; DESCRIPTION: Draws a magenta line from (469, 62) to (462, 176).
; PLAN: r0=469(x1), r1=62(y1), r2=462(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 62
LDI r2, 462
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
