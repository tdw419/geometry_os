; DESCRIPTION: Draws a green circle centered at (347, 197) with radius 52.
; PLAN: r0=347(x), r1=197(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 197
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
