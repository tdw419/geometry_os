; DESCRIPTION: Draws a magenta line from (162, 9) to (157, 171).
; PLAN: r0=162(x1), r1=9(y1), r2=157(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 9
LDI r2, 157
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
