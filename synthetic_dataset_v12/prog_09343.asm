; DESCRIPTION: Draws a magenta line from (85, 26) to (204, 182).
; PLAN: r0=85(x1), r1=26(y1), r2=204(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 26
LDI r2, 204
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
