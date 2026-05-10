; DESCRIPTION: Draws a magenta line from (233, 127) to (397, 149).
; PLAN: r0=233(x1), r1=127(y1), r2=397(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 127
LDI r2, 397
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
