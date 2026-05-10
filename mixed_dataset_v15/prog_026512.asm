; DESCRIPTION: Draws a magenta line from (297, 39) to (491, 118).
; PLAN: r0=297(x1), r1=39(y1), r2=491(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 39
LDI r2, 491
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
