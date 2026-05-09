; DESCRIPTION: Draws a magenta line from (190, 59) to (2, 87).
; PLAN: r0=190(x1), r1=59(y1), r2=2(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 59
LDI r2, 2
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
