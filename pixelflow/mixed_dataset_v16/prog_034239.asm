; DESCRIPTION: Draws a magenta line from (203, 171) to (77, 9).
; PLAN: r0=203(x1), r1=171(y1), r2=77(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 171
LDI r2, 77
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
