; DESCRIPTION: Draws a magenta line from (184, 161) to (344, 219).
; PLAN: r0=184(x1), r1=161(y1), r2=344(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 161
LDI r2, 344
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
