; DESCRIPTION: Draws a magenta line from (497, 132) to (265, 141).
; PLAN: r0=497(x1), r1=132(y1), r2=265(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 132
LDI r2, 265
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
