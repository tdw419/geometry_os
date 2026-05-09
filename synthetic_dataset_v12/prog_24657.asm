; DESCRIPTION: Draws a magenta line from (280, 203) to (417, 160).
; PLAN: r0=280(x1), r1=203(y1), r2=417(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 203
LDI r2, 417
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
