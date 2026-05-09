; DESCRIPTION: Composite: . Then Sets a single orange pixel at (114, 97). Then Draws a white circle centered at (63, 168) with radius 27.
; PLAN: r0=114(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=63(x), r1=168(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (114, 97).
; PLAN: r0=114(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (63, 168) with radius 27.
; PLAN: r0=63(x), r1=168(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 168
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
