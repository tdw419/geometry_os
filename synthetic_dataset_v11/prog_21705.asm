; DESCRIPTION: Draws a magenta line from (110, 7) to (122, 255).
; PLAN: r0=110(x1), r1=7(y1), r2=122(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 7
LDI r2, 122
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
