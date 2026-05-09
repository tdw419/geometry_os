; DESCRIPTION: Draws a green circle centered at (213, 126) with radius 48.
; PLAN: r0=213(x), r1=126(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 126
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
