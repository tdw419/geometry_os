; DESCRIPTION: Creates a cyan circular shape at (144, 125) with radius 17.
; PLAN: r0=144(x), r1=125(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 125
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
