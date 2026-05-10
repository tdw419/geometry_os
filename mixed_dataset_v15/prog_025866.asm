; DESCRIPTION: Draws a magenta line from (6, 180) to (315, 67).
; PLAN: r0=6(x1), r1=180(y1), r2=315(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 180
LDI r2, 315
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
