; DESCRIPTION: Draws a magenta line from (272, 50) to (1, 244).
; PLAN: r0=272(x1), r1=50(y1), r2=1(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 50
LDI r2, 1
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
