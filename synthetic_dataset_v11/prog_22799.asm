; DESCRIPTION: Composite: . Then Sets a single blue pixel at (190, 169). Then Draws a yellow circle centered at (143, 154) with radius 60.
; PLAN: r0=190(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=143(x), r1=154(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (190, 169).
; PLAN: r0=190(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (143, 154) with radius 60.
; PLAN: r0=143(x), r1=154(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 154
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
