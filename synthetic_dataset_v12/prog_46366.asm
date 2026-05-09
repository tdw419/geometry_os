; DESCRIPTION: Draws a magenta line from (222, 203) to (47, 125).
; PLAN: r0=222(x1), r1=203(y1), r2=47(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 203
LDI r2, 47
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
