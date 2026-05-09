; DESCRIPTION: Draws a magenta line from (339, 203) to (232, 249).
; PLAN: r0=339(x1), r1=203(y1), r2=232(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 203
LDI r2, 232
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
