; DESCRIPTION: Draws a blue line from (19, 191) to (294, 81).
; PLAN: r0=19(x1), r1=191(y1), r2=294(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 191
LDI r2, 294
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
