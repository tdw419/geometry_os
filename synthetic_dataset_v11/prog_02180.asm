; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (94, 65). Then Draws a white circle centered at (136, 189) with radius 27.
; PLAN: r0=94(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=189(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (94, 65).
; PLAN: r0=94(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (136, 189) with radius 27.
; PLAN: r0=136(x), r1=189(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 189
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
