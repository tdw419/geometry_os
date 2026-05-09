; DESCRIPTION: Draws a magenta line from (67, 10) to (100, 19).
; PLAN: r0=67(x1), r1=10(y1), r2=100(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 10
LDI r2, 100
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
