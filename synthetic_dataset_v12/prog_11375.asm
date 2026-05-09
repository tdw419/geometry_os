; DESCRIPTION: Draws a blue circle centered at (446, 118) with radius 48.
; PLAN: r0=446(x), r1=118(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 118
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
