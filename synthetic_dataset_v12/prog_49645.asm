; DESCRIPTION: Draws a magenta line from (99, 244) to (219, 50).
; PLAN: r0=99(x1), r1=244(y1), r2=219(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 244
LDI r2, 219
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
