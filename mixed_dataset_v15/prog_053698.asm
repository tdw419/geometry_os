; DESCRIPTION: Draws a magenta line from (353, 11) to (144, 38).
; PLAN: r0=353(x1), r1=11(y1), r2=144(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 11
LDI r2, 144
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
