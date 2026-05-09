; DESCRIPTION: Composite: . Then Sets a single blue pixel at (65, 14). Then Draws a yellow circle centered at (126, 186) with radius 67.
; PLAN: r0=65(x), r1=14(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=126(x), r1=186(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (65, 14).
; PLAN: r0=65(x), r1=14(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 14
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (126, 186) with radius 67.
; PLAN: r0=126(x), r1=186(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 186
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
