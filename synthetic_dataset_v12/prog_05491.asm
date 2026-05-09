; DESCRIPTION: Draws a magenta line from (371, 118) to (301, 204).
; PLAN: r0=371(x1), r1=118(y1), r2=301(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 118
LDI r2, 301
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
