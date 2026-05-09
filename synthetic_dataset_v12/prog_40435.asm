; DESCRIPTION: Draws a magenta line from (60, 84) to (481, 1).
; PLAN: r0=60(x1), r1=84(y1), r2=481(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 84
LDI r2, 481
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
