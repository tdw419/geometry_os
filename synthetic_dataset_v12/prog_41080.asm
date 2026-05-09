; DESCRIPTION: Draws a magenta line from (151, 166) to (189, 14).
; PLAN: r0=151(x1), r1=166(y1), r2=189(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 166
LDI r2, 189
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
