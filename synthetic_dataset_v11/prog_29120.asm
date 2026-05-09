; DESCRIPTION: Composite: . Then Draws a blue circle centered at (144, 128) with radius 58. Then Sets a single white pixel at (211, 205).
; PLAN: r0=144(x), r1=128(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x), r1=205(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue circle centered at (144, 128) with radius 58.
; PLAN: r0=144(x), r1=128(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 128
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (211, 205).
; PLAN: r0=211(x), r1=205(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 205
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
