; DESCRIPTION: Draws a magenta line from (129, 178) to (184, 28).
; PLAN: r0=129(x1), r1=178(y1), r2=184(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 178
LDI r2, 184
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
