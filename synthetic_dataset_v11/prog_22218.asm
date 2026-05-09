; DESCRIPTION: Draws a blue circle centered at (210, 186) with radius 39.
; PLAN: r0=210(x), r1=186(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 186
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
