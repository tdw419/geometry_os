; DESCRIPTION: Draws a green circle centered at (210, 208) with radius 39.
; PLAN: r0=210(x), r1=208(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 208
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
