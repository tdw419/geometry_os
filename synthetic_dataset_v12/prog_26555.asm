; DESCRIPTION: Draws a magenta line from (101, 254) to (71, 204).
; PLAN: r0=101(x1), r1=254(y1), r2=71(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 254
LDI r2, 71
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
