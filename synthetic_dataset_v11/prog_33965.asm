; DESCRIPTION: Draws a magenta line from (64, 122) to (184, 202).
; PLAN: r0=64(x1), r1=122(y1), r2=184(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 122
LDI r2, 184
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
