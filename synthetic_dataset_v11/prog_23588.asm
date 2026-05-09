; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (168, 159) with radius 15. Then Sets a single blue pixel at (198, 161).
; PLAN: r0=168(x), r1=159(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=198(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan circle centered at (168, 159) with radius 15.
; PLAN: r0=168(x), r1=159(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 159
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single blue pixel at (198, 161).
; PLAN: r0=198(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
