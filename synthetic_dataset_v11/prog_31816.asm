; DESCRIPTION: Draws a magenta line from (128, 161) to (162, 170).
; PLAN: r0=128(x1), r1=161(y1), r2=162(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 161
LDI r2, 162
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
