; DESCRIPTION: Draws a magenta line from (437, 95) to (270, 114).
; PLAN: r0=437(x1), r1=95(y1), r2=270(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 95
LDI r2, 270
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
