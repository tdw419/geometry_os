; DESCRIPTION: Draws a magenta line from (447, 84) to (461, 154).
; PLAN: r0=447(x1), r1=84(y1), r2=461(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 84
LDI r2, 461
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
