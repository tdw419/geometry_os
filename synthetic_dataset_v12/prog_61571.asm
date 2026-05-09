; DESCRIPTION: Draws a magenta line from (191, 157) to (510, 224).
; PLAN: r0=191(x1), r1=157(y1), r2=510(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 157
LDI r2, 510
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
