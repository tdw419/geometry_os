; DESCRIPTION: Draws a magenta line from (217, 70) to (124, 162).
; PLAN: r0=217(x1), r1=70(y1), r2=124(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 70
LDI r2, 124
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
