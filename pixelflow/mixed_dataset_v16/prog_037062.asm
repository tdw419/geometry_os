; DESCRIPTION: Draws a magenta line from (481, 214) to (13, 122).
; PLAN: r0=481(x1), r1=214(y1), r2=13(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 214
LDI r2, 13
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
