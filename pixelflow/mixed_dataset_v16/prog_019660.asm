; DESCRIPTION: Draws a magenta line from (490, 57) to (150, 108).
; PLAN: r0=490(x1), r1=57(y1), r2=150(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 57
LDI r2, 150
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
