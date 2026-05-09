; DESCRIPTION: Draws a green line from (19, 88) to (419, 102).
; PLAN: r0=19(x1), r1=88(y1), r2=419(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 88
LDI r2, 419
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
