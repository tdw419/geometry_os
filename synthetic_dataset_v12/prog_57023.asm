; DESCRIPTION: Draws a green circle centered at (173, 190) with radius 19.
; PLAN: r0=173(x), r1=190(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 190
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
