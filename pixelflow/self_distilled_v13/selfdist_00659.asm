; DESCRIPTION: Draws a magenta line from (185, 136) to (100, 16).
; PLAN: r0=185(x1), r1=136(y1), r2=100(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 136
LDI r2, 100
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
