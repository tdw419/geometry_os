; DESCRIPTION: Draws a magenta line from (63, 60) to (244, 150).
; PLAN: r0=63(x1), r1=60(y1), r2=244(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 60
LDI r2, 244
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
