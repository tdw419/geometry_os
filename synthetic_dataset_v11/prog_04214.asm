; DESCRIPTION: Draws a magenta line from (33, 177) to (111, 23).
; PLAN: r0=33(x1), r1=177(y1), r2=111(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 177
LDI r2, 111
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
