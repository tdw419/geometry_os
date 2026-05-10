; DESCRIPTION: Draws a magenta line from (327, 24) to (30, 205).
; PLAN: r0=327(x1), r1=24(y1), r2=30(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 24
LDI r2, 30
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
