; DESCRIPTION: Composite: Creates a magenta circular shape at (76, 113) with radius 50 then Sets a single cyan pixel at (428, 238).
; PLAN: r0=76(x), r1=113(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=238(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 113
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 238
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
