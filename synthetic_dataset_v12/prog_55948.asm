; DESCRIPTION: Draws a cyan circle centered at (144, 56) with radius 46.
; PLAN: r0=144(x), r1=56(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 56
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
