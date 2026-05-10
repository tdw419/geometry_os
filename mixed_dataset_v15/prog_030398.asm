; DESCRIPTION: Draws a magenta line from (63, 138) to (114, 8).
; PLAN: r0=63(x1), r1=138(y1), r2=114(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 138
LDI r2, 114
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
