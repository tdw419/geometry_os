; DESCRIPTION: Draws a magenta line from (165, 25) to (436, 35).
; PLAN: r0=165(x1), r1=25(y1), r2=436(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 25
LDI r2, 436
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
