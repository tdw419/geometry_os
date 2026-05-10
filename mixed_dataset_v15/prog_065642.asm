; DESCRIPTION: Draws a yellow circle centered at (192, 156) with radius 27.
; PLAN: r0=192(x), r1=156(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 156
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
