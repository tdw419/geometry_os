; DESCRIPTION: Draws a blue line from (384, 91) to (143, 205).
; PLAN: r0=384(x1), r1=91(y1), r2=143(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 91
LDI r2, 143
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
