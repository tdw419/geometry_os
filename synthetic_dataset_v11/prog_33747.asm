; DESCRIPTION: Composite: . Then Draws a orange circle centered at (146, 64) with radius 23. Then Sets a single orange pixel at (63, 162).
; PLAN: r0=146(x), r1=64(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=63(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange circle centered at (146, 64) with radius 23.
; PLAN: r0=146(x), r1=64(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 64
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (63, 162).
; PLAN: r0=63(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
