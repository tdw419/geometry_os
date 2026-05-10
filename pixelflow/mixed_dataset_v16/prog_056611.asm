; DESCRIPTION: Draws a magenta line from (165, 184) to (341, 117).
; PLAN: r0=165(x1), r1=184(y1), r2=341(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 184
LDI r2, 341
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
