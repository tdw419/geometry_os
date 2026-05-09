; DESCRIPTION: Draws a magenta line from (135, 217) to (397, 172).
; PLAN: r0=135(x1), r1=217(y1), r2=397(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 217
LDI r2, 397
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
