; DESCRIPTION: Draws a magenta line from (19, 191) to (222, 238).
; PLAN: r0=19(x1), r1=191(y1), r2=222(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 191
LDI r2, 222
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
