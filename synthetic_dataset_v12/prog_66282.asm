; DESCRIPTION: Composite: Creates a magenta circular shape at (194, 67) with radius 40 then Sets a single cyan pixel at (346, 244).
; PLAN: r0=194(x), r1=67(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=244(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 67
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 244
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
