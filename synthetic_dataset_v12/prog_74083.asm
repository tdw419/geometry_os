; DESCRIPTION: Draws a magenta line from (402, 222) to (62, 226).
; PLAN: r0=402(x1), r1=222(y1), r2=62(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 222
LDI r2, 62
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
