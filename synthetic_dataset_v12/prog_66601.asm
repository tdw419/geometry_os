; DESCRIPTION: Draws a magenta line from (477, 237) to (65, 246).
; PLAN: r0=477(x1), r1=237(y1), r2=65(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 237
LDI r2, 65
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
