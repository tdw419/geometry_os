; DESCRIPTION: Draws a magenta line from (201, 182) to (196, 190).
; PLAN: r0=201(x1), r1=182(y1), r2=196(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 182
LDI r2, 196
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
