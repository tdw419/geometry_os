; DESCRIPTION: Draws a magenta line from (492, 113) to (29, 79).
; PLAN: r0=492(x1), r1=113(y1), r2=29(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 113
LDI r2, 29
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
