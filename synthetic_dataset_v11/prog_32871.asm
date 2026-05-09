; DESCRIPTION: Draws a magenta line from (246, 124) to (159, 13).
; PLAN: r0=246(x1), r1=124(y1), r2=159(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 124
LDI r2, 159
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
