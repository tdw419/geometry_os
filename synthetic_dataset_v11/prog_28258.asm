; DESCRIPTION: Draws a magenta line from (151, 238) to (47, 203).
; PLAN: r0=151(x1), r1=238(y1), r2=47(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 238
LDI r2, 47
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
