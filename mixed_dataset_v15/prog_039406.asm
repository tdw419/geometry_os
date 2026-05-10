; DESCRIPTION: Draws a magenta line from (465, 102) to (341, 29).
; PLAN: r0=465(x1), r1=102(y1), r2=341(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 102
LDI r2, 341
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
