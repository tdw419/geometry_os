; DESCRIPTION: Draws a green circle centered at (213, 173) with radius 25.
; PLAN: r0=213(x), r1=173(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 173
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
