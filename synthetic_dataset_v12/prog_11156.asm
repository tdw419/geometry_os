; DESCRIPTION: Draws a magenta line from (4, 15) to (279, 219).
; PLAN: r0=4(x1), r1=15(y1), r2=279(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 15
LDI r2, 279
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
