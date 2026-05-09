; DESCRIPTION: Draws a yellow circle centered at (330, 173) with radius 12.
; PLAN: r0=330(x), r1=173(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 173
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
