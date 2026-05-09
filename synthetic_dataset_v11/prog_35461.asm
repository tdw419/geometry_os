; DESCRIPTION: Draws a magenta line from (170, 165) to (75, 157).
; PLAN: r0=170(x1), r1=165(y1), r2=75(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 165
LDI r2, 75
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
