; DESCRIPTION: Draws a magenta line from (367, 246) to (164, 7).
; PLAN: r0=367(x1), r1=246(y1), r2=164(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 246
LDI r2, 164
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
