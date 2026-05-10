; DESCRIPTION: Draws a magenta line from (280, 43) to (286, 207).
; PLAN: r0=280(x1), r1=43(y1), r2=286(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 43
LDI r2, 286
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
