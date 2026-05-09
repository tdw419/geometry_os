; DESCRIPTION: Draws a magenta line from (198, 203) to (338, 185).
; PLAN: r0=198(x1), r1=203(y1), r2=338(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 203
LDI r2, 338
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
