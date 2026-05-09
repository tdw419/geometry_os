; DESCRIPTION: Draws a magenta line from (60, 80) to (105, 138).
; PLAN: r0=60(x1), r1=80(y1), r2=105(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 80
LDI r2, 105
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
