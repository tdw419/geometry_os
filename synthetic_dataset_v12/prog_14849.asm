; DESCRIPTION: Draws a magenta line from (172, 202) to (495, 63).
; PLAN: r0=172(x1), r1=202(y1), r2=495(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 202
LDI r2, 495
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
