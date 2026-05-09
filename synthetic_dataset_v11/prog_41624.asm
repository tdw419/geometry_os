; DESCRIPTION: Draws a magenta line from (85, 37) to (46, 73).
; PLAN: r0=85(x1), r1=37(y1), r2=46(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 37
LDI r2, 46
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
