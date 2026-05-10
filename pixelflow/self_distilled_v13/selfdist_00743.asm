; DESCRIPTION: Draws a magenta line from (246, 197) to (60, 100).
; PLAN: r0=246(x1), r1=197(y1), r2=60(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 197
LDI r2, 60
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
