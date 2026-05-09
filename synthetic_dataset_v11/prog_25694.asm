; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (249, 47). Then Draws a white circle centered at (168, 242) with radius 11.
; PLAN: r0=249(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=168(x), r1=242(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (249, 47).
; PLAN: r0=249(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (168, 242) with radius 11.
; PLAN: r0=168(x), r1=242(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 242
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
