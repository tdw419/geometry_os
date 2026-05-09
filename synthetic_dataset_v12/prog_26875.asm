; DESCRIPTION: Draws a magenta line from (480, 37) to (136, 206).
; PLAN: r0=480(x1), r1=37(y1), r2=136(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 37
LDI r2, 136
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
