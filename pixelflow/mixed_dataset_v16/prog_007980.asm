; DESCRIPTION: Draws a magenta line from (174, 49) to (509, 204).
; PLAN: r0=174(x1), r1=49(y1), r2=509(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 49
LDI r2, 509
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
