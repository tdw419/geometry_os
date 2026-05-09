; DESCRIPTION: Composite: . Then Draws a blue line from (241, 216) to (29, 128). Then Draws a red circle centered at (99, 84) with radius 75.
; PLAN: r0=241(x1), r1=216(y1), r2=29(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=84(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (241, 216) to (29, 128).
; PLAN: r0=241(x1), r1=216(y1), r2=29(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 216
LDI r2, 29
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (99, 84) with radius 75.
; PLAN: r0=99(x), r1=84(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 84
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
