; DESCRIPTION: Draws a magenta line from (135, 29) to (177, 162).
; PLAN: r0=135(x1), r1=29(y1), r2=177(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 29
LDI r2, 177
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
