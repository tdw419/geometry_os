; DESCRIPTION: Composite: Sets a single white pixel at (305, 108) then Draws a green circle centered at (384, 86) with radius 16.
; PLAN: r0=305(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=86(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 86
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
