; DESCRIPTION: Draws a magenta line from (482, 114) to (118, 168).
; PLAN: r0=482(x1), r1=114(y1), r2=118(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 114
LDI r2, 118
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
