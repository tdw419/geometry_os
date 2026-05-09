; DESCRIPTION: Draws a magenta line from (496, 12) to (414, 113).
; PLAN: r0=496(x1), r1=12(y1), r2=414(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 12
LDI r2, 414
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
