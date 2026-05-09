; DESCRIPTION: Draws a magenta line from (350, 55) to (500, 194).
; PLAN: r0=350(x1), r1=55(y1), r2=500(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 55
LDI r2, 500
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
