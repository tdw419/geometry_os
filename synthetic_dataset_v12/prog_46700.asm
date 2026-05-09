; DESCRIPTION: Draws a magenta line from (253, 206) to (351, 135).
; PLAN: r0=253(x1), r1=206(y1), r2=351(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 206
LDI r2, 351
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
