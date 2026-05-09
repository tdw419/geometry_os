; DESCRIPTION: Draws a magenta line from (429, 67) to (36, 40).
; PLAN: r0=429(x1), r1=67(y1), r2=36(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 67
LDI r2, 36
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
