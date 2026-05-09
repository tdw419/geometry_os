; DESCRIPTION: Draws a magenta line from (107, 135) to (84, 67).
; PLAN: r0=107(x1), r1=135(y1), r2=84(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 135
LDI r2, 84
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
