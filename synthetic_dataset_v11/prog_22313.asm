; DESCRIPTION: Draws a magenta line from (91, 6) to (30, 22).
; PLAN: r0=91(x1), r1=6(y1), r2=30(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 6
LDI r2, 30
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
