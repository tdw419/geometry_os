; DESCRIPTION: Draws a magenta line from (180, 135) to (366, 72).
; PLAN: r0=180(x1), r1=135(y1), r2=366(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 135
LDI r2, 366
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
