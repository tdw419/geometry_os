; DESCRIPTION: Draws a magenta line from (20, 39) to (100, 53).
; PLAN: r0=20(x1), r1=39(y1), r2=100(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 39
LDI r2, 100
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
