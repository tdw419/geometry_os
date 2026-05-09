; DESCRIPTION: Draws a magenta line from (210, 127) to (33, 64).
; PLAN: r0=210(x1), r1=127(y1), r2=33(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 127
LDI r2, 33
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
