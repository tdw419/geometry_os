; DESCRIPTION: Draws a magenta line from (252, 92) to (254, 21).
; PLAN: r0=252(x1), r1=92(y1), r2=254(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 92
LDI r2, 254
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
