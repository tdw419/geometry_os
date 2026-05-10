; DESCRIPTION: Draws a yellow circle centered at (160, 173) with radius 75.
; PLAN: r0=160(x), r1=173(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 173
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
