; DESCRIPTION: Draws a magenta line from (267, 225) to (462, 1).
; PLAN: r0=267(x1), r1=225(y1), r2=462(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 225
LDI r2, 462
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
