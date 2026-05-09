; DESCRIPTION: Draws a magenta line from (133, 27) to (497, 229).
; PLAN: r0=133(x1), r1=27(y1), r2=497(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 27
LDI r2, 497
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
