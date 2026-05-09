; DESCRIPTION: Draws a magenta line from (6, 135) to (241, 3).
; PLAN: r0=6(x1), r1=135(y1), r2=241(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 135
LDI r2, 241
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
