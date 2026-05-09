; DESCRIPTION: Draws a magenta line from (128, 183) to (191, 150).
; PLAN: r0=128(x1), r1=183(y1), r2=191(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 183
LDI r2, 191
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
