; DESCRIPTION: Draws a magenta line from (211, 22) to (499, 22).
; PLAN: r0=211(x1), r1=22(y1), r2=499(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 22
LDI r2, 499
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
