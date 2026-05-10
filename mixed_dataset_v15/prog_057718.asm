; DESCRIPTION: Draws a magenta horizontal line across the screen at y=127.
; PLAN: r0=127(x1), r1=1(y1), r2=1(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 1
LDI r2, 1
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
