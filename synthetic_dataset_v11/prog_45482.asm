; DESCRIPTION: Draws a cyan circle centered at (127, 230) with radius 17.
; PLAN: r0=127(x), r1=230(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 230
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
