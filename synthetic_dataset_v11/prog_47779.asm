; DESCRIPTION: Composite: . Then Renders a blue line between points (196, 152) and (0, 219). Then Draws a orange circle centered at (97, 111) with radius 72.
; PLAN: r0=196(x1), r1=152(y1), r2=0(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=111(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (196, 152) and (0, 219).
; PLAN: r0=196(x1), r1=152(y1), r2=0(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 152
LDI r2, 0
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (97, 111) with radius 72.
; PLAN: r0=97(x), r1=111(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 111
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
