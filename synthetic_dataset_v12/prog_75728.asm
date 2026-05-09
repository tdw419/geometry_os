; DESCRIPTION: Draws a magenta line from (353, 36) to (120, 11).
; PLAN: r0=353(x1), r1=36(y1), r2=120(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 36
LDI r2, 120
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
