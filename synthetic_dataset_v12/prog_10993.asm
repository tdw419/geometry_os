; DESCRIPTION: Draws a green circle centered at (263, 239) with radius 14.
; PLAN: r0=263(x), r1=239(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 239
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
