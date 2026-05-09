; DESCRIPTION: Draws a cyan circle centered at (144, 241) with radius 10.
; PLAN: r0=144(x), r1=241(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 241
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
