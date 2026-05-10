; DESCRIPTION: Draws a magenta line from (413, 97) to (183, 127).
; PLAN: r0=413(x1), r1=97(y1), r2=183(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 97
LDI r2, 183
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
