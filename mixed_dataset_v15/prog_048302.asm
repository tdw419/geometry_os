; DESCRIPTION: Draws a green line from (451, 96) to (238, 20).
; PLAN: r0=451(x1), r1=96(y1), r2=238(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 96
LDI r2, 238
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
