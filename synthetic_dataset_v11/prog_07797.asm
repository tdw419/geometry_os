; DESCRIPTION: Draws a magenta line from (205, 127) to (165, 64).
; PLAN: r0=205(x1), r1=127(y1), r2=165(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 127
LDI r2, 165
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
