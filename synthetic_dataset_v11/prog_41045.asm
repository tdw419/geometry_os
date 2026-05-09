; DESCRIPTION: Draws a magenta line from (118, 29) to (238, 5).
; PLAN: r0=118(x1), r1=29(y1), r2=238(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 29
LDI r2, 238
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
