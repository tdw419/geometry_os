; DESCRIPTION: Draws a magenta line from (492, 142) to (364, 94).
; PLAN: r0=492(x1), r1=142(y1), r2=364(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 142
LDI r2, 364
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
