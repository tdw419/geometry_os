; DESCRIPTION: Draws a magenta line from (184, 183) to (30, 221).
; PLAN: r0=184(x1), r1=183(y1), r2=30(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 183
LDI r2, 30
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
