; DESCRIPTION: Draws a magenta line from (166, 78) to (481, 252).
; PLAN: r0=166(x1), r1=78(y1), r2=481(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 78
LDI r2, 481
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
