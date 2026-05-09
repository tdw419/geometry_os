; DESCRIPTION: Draws a magenta line from (73, 76) to (44, 127).
; PLAN: r0=73(x1), r1=76(y1), r2=44(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 76
LDI r2, 44
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
