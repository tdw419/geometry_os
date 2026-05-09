; DESCRIPTION: Draws a magenta line from (213, 64) to (219, 31).
; PLAN: r0=213(x1), r1=64(y1), r2=219(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 64
LDI r2, 219
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
