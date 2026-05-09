; DESCRIPTION: Draws a magenta line from (138, 116) to (97, 110).
; PLAN: r0=138(x1), r1=116(y1), r2=97(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 116
LDI r2, 97
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
