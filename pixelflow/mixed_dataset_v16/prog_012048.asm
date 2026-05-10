; DESCRIPTION: Draws a magenta line from (469, 71) to (159, 190).
; PLAN: r0=469(x1), r1=71(y1), r2=159(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 71
LDI r2, 159
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
