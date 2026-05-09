; DESCRIPTION: Draws a magenta line from (15, 158) to (2, 42).
; PLAN: r0=15(x1), r1=158(y1), r2=2(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 158
LDI r2, 2
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
