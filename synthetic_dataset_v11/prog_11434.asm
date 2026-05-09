; DESCRIPTION: Draws a magenta line from (187, 252) to (153, 135).
; PLAN: r0=187(x1), r1=252(y1), r2=153(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 252
LDI r2, 153
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
