; DESCRIPTION: Draws a magenta line from (409, 164) to (312, 121).
; PLAN: r0=409(x1), r1=164(y1), r2=312(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 164
LDI r2, 312
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
