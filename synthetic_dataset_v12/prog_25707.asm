; DESCRIPTION: Draws a green circle centered at (384, 228) with radius 17.
; PLAN: r0=384(x), r1=228(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 228
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
