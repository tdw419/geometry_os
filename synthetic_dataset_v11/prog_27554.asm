; DESCRIPTION: Draws a magenta line from (3, 202) to (184, 30).
; PLAN: r0=3(x1), r1=202(y1), r2=184(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 202
LDI r2, 184
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
