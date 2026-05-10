; DESCRIPTION: Draws a magenta line from (30, 207) to (265, 22).
; PLAN: r0=30(x1), r1=207(y1), r2=265(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 207
LDI r2, 265
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
