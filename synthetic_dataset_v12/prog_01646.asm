; DESCRIPTION: Draws a magenta line from (301, 84) to (469, 157).
; PLAN: r0=301(x1), r1=84(y1), r2=469(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 84
LDI r2, 469
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
