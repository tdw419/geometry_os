; DESCRIPTION: Draws a magenta line from (73, 156) to (196, 182).
; PLAN: r0=73(x1), r1=156(y1), r2=196(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 156
LDI r2, 196
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
