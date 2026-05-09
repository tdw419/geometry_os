; DESCRIPTION: Draws a magenta line from (165, 64) to (135, 252).
; PLAN: r0=165(x1), r1=64(y1), r2=135(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 64
LDI r2, 135
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
