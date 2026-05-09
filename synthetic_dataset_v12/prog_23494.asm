; DESCRIPTION: Draws a magenta line from (150, 161) to (107, 162).
; PLAN: r0=150(x1), r1=161(y1), r2=107(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 161
LDI r2, 107
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
