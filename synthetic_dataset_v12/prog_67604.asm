; DESCRIPTION: Draws a yellow circle centered at (372, 205) with radius 32.
; PLAN: r0=372(x), r1=205(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 205
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
