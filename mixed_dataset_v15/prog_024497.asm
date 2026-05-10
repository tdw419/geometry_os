; DESCRIPTION: Draws a magenta line from (195, 37) to (203, 87).
; PLAN: r0=195(x1), r1=37(y1), r2=203(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 37
LDI r2, 203
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
