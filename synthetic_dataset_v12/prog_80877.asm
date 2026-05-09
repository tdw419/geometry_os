; DESCRIPTION: Draws a magenta line from (344, 252) to (271, 117).
; PLAN: r0=344(x1), r1=252(y1), r2=271(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 252
LDI r2, 271
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
