; DESCRIPTION: Draws a magenta line from (509, 181) to (8, 46).
; PLAN: r0=509(x1), r1=181(y1), r2=8(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 181
LDI r2, 8
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
