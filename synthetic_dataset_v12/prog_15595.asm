; DESCRIPTION: Draws a magenta line from (481, 200) to (39, 17).
; PLAN: r0=481(x1), r1=200(y1), r2=39(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 200
LDI r2, 39
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
