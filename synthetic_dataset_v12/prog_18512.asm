; DESCRIPTION: Draws a magenta line from (375, 246) to (332, 196).
; PLAN: r0=375(x1), r1=246(y1), r2=332(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 246
LDI r2, 332
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
