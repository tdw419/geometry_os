; DESCRIPTION: Draws a magenta line from (183, 249) to (97, 73).
; PLAN: r0=183(x1), r1=249(y1), r2=97(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 249
LDI r2, 97
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
