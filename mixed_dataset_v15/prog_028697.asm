; DESCRIPTION: Draws a magenta line from (318, 15) to (485, 217).
; PLAN: r0=318(x1), r1=15(y1), r2=485(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 15
LDI r2, 485
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
