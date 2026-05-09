; DESCRIPTION: Draws a magenta line from (50, 97) to (339, 10).
; PLAN: r0=50(x1), r1=97(y1), r2=339(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 97
LDI r2, 339
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
