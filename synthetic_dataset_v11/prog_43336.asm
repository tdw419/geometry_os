; DESCRIPTION: Draws a magenta line from (149, 102) to (217, 70).
; PLAN: r0=149(x1), r1=102(y1), r2=217(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 102
LDI r2, 217
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
