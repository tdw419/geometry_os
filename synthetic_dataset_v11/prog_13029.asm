; DESCRIPTION: Draws a magenta line from (141, 101) to (32, 40).
; PLAN: r0=141(x1), r1=101(y1), r2=32(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 101
LDI r2, 32
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
