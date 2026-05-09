; DESCRIPTION: Draws a magenta line from (282, 72) to (197, 90).
; PLAN: r0=282(x1), r1=72(y1), r2=197(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 72
LDI r2, 197
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
