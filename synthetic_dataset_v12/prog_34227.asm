; DESCRIPTION: Draws a magenta line from (142, 55) to (250, 172).
; PLAN: r0=142(x1), r1=55(y1), r2=250(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 55
LDI r2, 250
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
