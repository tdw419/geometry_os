; DESCRIPTION: Draws a magenta line from (457, 8) to (291, 10).
; PLAN: r0=457(x1), r1=8(y1), r2=291(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 8
LDI r2, 291
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
