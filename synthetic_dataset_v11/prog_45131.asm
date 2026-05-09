; DESCRIPTION: Draws a magenta line from (232, 3) to (74, 171).
; PLAN: r0=232(x1), r1=3(y1), r2=74(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 3
LDI r2, 74
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
