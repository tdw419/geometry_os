; DESCRIPTION: Draws a magenta line from (175, 192) to (55, 3).
; PLAN: r0=175(x1), r1=192(y1), r2=55(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 192
LDI r2, 55
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
