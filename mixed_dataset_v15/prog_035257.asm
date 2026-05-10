; DESCRIPTION: Draws a magenta horizontal line across the screen at y=129.
; PLAN: r0=129(x1), r1=1(y1), r2=1(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 1
LDI r2, 1
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
