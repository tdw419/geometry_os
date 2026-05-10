; DESCRIPTION: Draws a magenta line from (362, 77) to (246, 103).
; PLAN: r0=362(x1), r1=77(y1), r2=246(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 77
LDI r2, 246
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
