; DESCRIPTION: Draws a magenta line from (437, 134) to (497, 197).
; PLAN: r0=437(x1), r1=134(y1), r2=497(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 134
LDI r2, 497
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
