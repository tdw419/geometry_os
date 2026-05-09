; DESCRIPTION: Draws a magenta line from (100, 98) to (0, 219).
; PLAN: r0=100(x1), r1=98(y1), r2=0(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 98
LDI r2, 0
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
