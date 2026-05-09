; DESCRIPTION: Draws a magenta line from (59, 126) to (130, 165).
; PLAN: r0=59(x1), r1=126(y1), r2=130(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 126
LDI r2, 130
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
