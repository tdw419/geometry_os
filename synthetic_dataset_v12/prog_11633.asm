; DESCRIPTION: Draws a magenta line from (332, 116) to (102, 73).
; PLAN: r0=332(x1), r1=116(y1), r2=102(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 116
LDI r2, 102
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
