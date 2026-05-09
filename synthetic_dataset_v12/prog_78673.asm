; DESCRIPTION: Composite: Creates a magenta circular shape at (372, 128) with radius 50 then Sets a single yellow pixel at (326, 156).
; PLAN: r0=372(x), r1=128(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 128
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
