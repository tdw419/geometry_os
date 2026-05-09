; DESCRIPTION: Draws a magenta line from (113, 46) to (454, 131).
; PLAN: r0=113(x1), r1=46(y1), r2=454(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 454
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
